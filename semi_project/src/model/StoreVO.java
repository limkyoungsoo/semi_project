package model;

public class StoreVO {
	private String storeName;
	private String storeLoc;
	private String storeTel;
	private String storePic;
	private String openHour;
	private String storePla;
	private MenuVO menuVO;
	private int rnum;

	public StoreVO(String storeName, String storeLoc, String storeTel, String storePic, String openHour,
			String storePla, MenuVO menuVO, int rnum) {
		super();
		this.storeName = storeName;
		this.storeLoc = storeLoc;
		this.storeTel = storeTel;
		this.storePic = storePic;
		this.openHour = openHour;
		this.storePla = storePla;
		this.menuVO = menuVO;
		this.rnum = rnum;
	}

	public StoreVO() {
		super();
	}

	public StoreVO(String storePla) {
		super();
		this.storePla = storePla;
	}

	public StoreVO(String storeName, String storeLoc, String storeTel, String storePic, String openHour, MenuVO menuVO,
			int rnum) {
		super();
		this.storeName = storeName;
		this.storeLoc = storeLoc;
		this.storeTel = storeTel;
		this.storePic = storePic;
		this.openHour = openHour;
		this.menuVO = menuVO;
		this.rnum = rnum;
	}

	public StoreVO(String storeName, String storePla, String storeLoc, String storeTel, String storePic,
			String openHour, MenuVO menuVO) {
		super();
		this.storeName = storeName;
		this.storePla = storePla;
		this.storeLoc = storeLoc;
		this.storeTel = storeTel;
		this.storePic = storePic;
		this.openHour = openHour;
		this.menuVO = menuVO;
	}

	public StoreVO(String storeName, String storeLoc, String storePic) {
		super();
		this.storeName = storeName;
		this.storeLoc = storeLoc;
		this.storePic = storePic;
	}

	public StoreVO(int rnum, String name, String loc, String tel, String pic_addr, String openHour) {
		super();
		this.rnum = rnum;
		this.storeName = name;
		this.storeLoc = loc;
		this.storeTel = tel;
		this.storePic = pic_addr;
		this.openHour = openHour;
	}

	public StoreVO(String storeName, String storeLoc, String storeTel, String storePic, String openHour,
			String storePla) {
		this.storeName = storeName;
		this.storeLoc = storeLoc;
		this.storeTel = storeTel;
		this.storePic = storePic;
		this.openHour = openHour;
		this.storePla = storePla;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStoreLoc() {
		return storeLoc;
	}

	public void setStoreLoc(String storeLoc) {
		this.storeLoc = storeLoc;
	}

	public String getStoreTel() {
		return storeTel;
	}

	public void setStoreTel(String storeTel) {
		this.storeTel = storeTel;
	}

	public String getStorePic() {
		return storePic;
	}

	public void setStorePic(String storePic) {
		this.storePic = storePic;
	}

	public String getOpenHour() {
		return openHour;
	}

	public void setOpenHour(String openHour) {
		this.openHour = openHour;
	}

	public String getStorePla() {
		return storePla;
	}

	public void setStorePla(String storePla) {
		this.storePla = storePla;
	}

	public MenuVO getMenuVO() {
		return menuVO;
	}

	public void setMenuVO(MenuVO menuVO) {
		this.menuVO = menuVO;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	@Override
	public String toString() {
		return "StoreVO [storeName=" + storeName + ", storeLoc=" + storeLoc + ", storeTel=" + storeTel + ", storePic="
				+ storePic + ", openHour=" + openHour + ", storePla=" + storePla + ", menuVO=" + menuVO + ", rnum="
				+ rnum + "]";
	}
}
