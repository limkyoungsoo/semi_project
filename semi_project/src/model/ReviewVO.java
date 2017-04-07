package model;

import java.util.ArrayList;

public class ReviewVO {
	private int reviewNo;
	private float grade;
	private String review;
	private String mid;
	private String timePosted;
	private int menuNo;
	//평점 받아오기 위해 추가했음
	private int avgGrade;
	private String menuName;
	
	public ReviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ReviewVO(float grade) {
		super();
		this.grade = grade;
	}
	
	public ReviewVO(float grade, String review, String mid, int menuNo) {
		super();
		this.grade = grade;
		this.review = review;
		this.mid = mid;
		this.menuNo = menuNo;
	}

	public ReviewVO(float grade, String review, String mid, String timePosted, int menuNo) {
		super();
		this.grade = grade;
		this.review = review;
		this.mid = mid;
		this.timePosted = timePosted;
		this.menuNo = menuNo;
	}

	public ReviewVO(int reviewNo, float grade, String review, String mid, String timePosted, int menuNo) {
		super();
		this.reviewNo = reviewNo;
		this.grade = grade;
		this.review = review;
		this.mid = mid;
		this.timePosted = timePosted;
		this.menuNo = menuNo;
	}
	
	public ReviewVO(int reviewNo, float grade, String review, String mid, String timePosted, int menuNo, int avgGrade) {
		super();
		this.reviewNo = reviewNo;
		this.grade = grade;
		this.review = review;
		this.mid = mid;
		this.timePosted = timePosted;
		this.menuNo = menuNo;
		this.avgGrade = avgGrade;
	}
	
	public ReviewVO(int reviewNo, float grade, String review, String mid, String timePosted, int menuNo,
			String menuName) {
		super();
		this.reviewNo = reviewNo;
		this.grade = grade;
		this.review = review;
		this.mid = mid;
		this.timePosted = timePosted;
		this.menuNo = menuNo;
		this.menuName = menuName;
	}

	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public float getGrade() {
		return grade;
	}
	public void setGrade(float grade) {
		this.grade = grade;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getTimePosted() {
		return timePosted;
	}
	public void setTimePosted(String timePosted) {
		this.timePosted = timePosted;
	}
	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	
	public int getAvgGrade() {
		return avgGrade;
	}

	public void setAvgGrade(int avgGrade) {
		this.avgGrade = avgGrade;
	}
	
	
	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public int calAvg(ArrayList<ReviewVO> review){
		float reviewAvg = 0;
		
		for(int i=0; i<review.size();i++){
			reviewAvg += review.get(i).getGrade();
		}
		reviewAvg =reviewAvg/review.size();
		int avg = Math.round(reviewAvg);
		return avg;
		
	}

	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", grade=" + grade + ", review=" + review + ", mid=" + mid
				+ ", timePosted=" + timePosted + ", menuNo=" + menuNo + ", avgGrade=" + avgGrade + "]";
	}

}
