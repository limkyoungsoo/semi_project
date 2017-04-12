package model;

//ReviewVO 의 변수가 계속 증가하여 
//새로운 MyReviewVO 생성

public class MyReviewVO extends ReviewVO{
	private ReviewVO reviewVO;
	private String storeName;
	
	public MyReviewVO(ReviewVO reviewVO, String storeName) {
		super();
		this.reviewVO = reviewVO;
		this.storeName = storeName;
	}

	public ReviewVO getReviewVO() {
		return reviewVO;
	}

	public void setReviewVO(ReviewVO reviewVO) {
		this.reviewVO = reviewVO;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	@Override
	public String toString() {
		return "MyReviewVO [reviewVO=" + reviewVO + ", storeName=" + storeName + "]";
	} 
	
}
