package model;

public class ReviewVO {
	private int reviewNo;
	private float grade;
	private String review;
	private String mid;
	private String timePosted;
	private int menuNo;
	public ReviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public ReviewVO(float grade, String review, String mid, int menuNo) {
		super();
		this.grade = grade;
		this.review = review;
		this.mid = mid;
		this.menuNo = menuNo;
	}



	public ReviewVO(float grade) {
		super();
		this.grade = grade;
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
	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", grade=" + grade + ", review=" + review + ", mid=" + mid
				+ ", timePosted=" + timePosted + ", menuNo=" + menuNo + "]";
	}

}
