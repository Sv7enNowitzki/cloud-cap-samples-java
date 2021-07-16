package my.bookshop.handlers;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.stream.Stream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.sap.cds.Row;
import com.sap.cds.ql.Select;
import com.sap.cds.services.cds.CqnService;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.After;
import com.sap.cds.services.handler.annotations.ServiceName;

import cds.gen.reviewservice.ReviewService_;
import cds.gen.reviewservice.Reviewed;
import cds.gen.reviewservice.ReviewedContext;
import cds.gen.reviewservice.Reviews;
import cds.gen.reviewservice.Reviews_;

@Component
@ServiceName(ReviewService_.CDS_NAME)
public class ReviewServiceHandler implements EventHandler {

	private static final Logger logger = LoggerFactory.getLogger(ReviewServiceHandler.class);

	@Autowired
	@Qualifier(ReviewService_.CDS_NAME)
	CqnService reviewService;

	@After(event = { CqnService.EVENT_CREATE, CqnService.EVENT_UPSERT, CqnService.EVENT_UPDATE })
	public void afterAddReview(Stream<Reviews> reviews) {
		reviews.forEach(review -> {

			// calculate the average rating of the subject
			List<Row> ratings = reviewService.run(Select.from(Reviews_.CDS_NAME).columns(r -> r.get("rating").asValue()).where(r -> r.get("subject").eq(review.getSubject()))).list();
			Double avg = ratings.stream().mapToDouble(r -> ((Integer) r.get("rating")).doubleValue()).average().orElse(0);

			Reviewed event = Reviewed.create();
			event.setSubject(review.getSubject());
			event.setRating(BigDecimal.valueOf(avg).setScale(1, RoundingMode.HALF_UP));

			ReviewedContext evContext = ReviewedContext.create();
			evContext.setData(event);

			reviewService.emit(evContext);

			logger.info("The review for '{}' with avg rating '{}' was created and notified.", event.getSubject(), event.getRating());
		});
	}
}
