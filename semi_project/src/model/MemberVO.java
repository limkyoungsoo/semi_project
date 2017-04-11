package model;

public class MemberVO {
	private String mId;
	private String mPass;
	private String mNick;
	private String mGrant;

	public MemberVO(MemberVO memberVO) {
		super();
	}

	public MemberVO() {
	}

	public MemberVO(String mId, String mNick, String mGrant) {
		super();
		this.mId = mId;
		this.mNick = mNick;
		this.mGrant = mGrant;
	}

	public MemberVO(String mId, String mPass, String mNick, String mGrant) {
		this.mId = mId;
		this.mPass = mPass;
		this.mNick = mNick;
		this.mGrant = mGrant;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPass() {
		return mPass;
	}

	public void setmPass(String mPass) {
		this.mPass = mPass;
	}

	public String getmNick() {
		return mNick;
	}

	public void setmNick(String mNick) {
		this.mNick = mNick;
	}

	public String getmGrant() {
		return mGrant;
	}

	public void setmGrant(String mGrant) {
		this.mGrant = mGrant;
	}

	@Override
	public String toString() {
		return "MemberVO [mId=" + mId + ", mPass=" + mPass + ", mNick=" + mNick + ", mGrant=" + mGrant + "]";
	}

}
