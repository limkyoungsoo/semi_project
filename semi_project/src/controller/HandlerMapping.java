package controller;

public class HandlerMapping {
	private static HandlerMapping instance = new HandlerMapping();

	private HandlerMapping() {
	}

	public static HandlerMapping getInstance() {
		return instance;
	}

	public Controller create(String command) {
		Controller c = null;

		System.out.println("커맨드" + command);

		if (command.equals("storeShow")) {
			c = new StoreShowController();
		} else if (command.equals("detailStore")) {
			c = new DetailStoreController();
		} else if (command.equals("reviewList")) {
			c = new ReviewListController();
		} else if (command.equals("starScore")) {
			c = new StarScoreController();
		} else if (command.equals("storeList")) {
			c = new ListController();
		} else if (command.equals("register")) {
			c = new RegisterController();
		} else if (command.equals("randSelect")) {
			c = new RandomSelectController();
		} else if (command.equals("storeAllList")) {
			c = new AllStoreListController();
		} else if (command.equals("idCheck")) {
			c = new CheckIdController();
		} else if (command.equals("login")) {
			c = new LoginController();
		} else if (command.equals("logout")) {
			c = new LogoutController();
		} else if (command.equals("detailOtherMenu")) {
			c = new DetailOtherMenuController();
		} else if (command.equals("updateMemberInfo")) {
			c = new UpdateMemberInfoController();
		} else if (command.equals("markList")) {
			c = new MarkListController();
		} else if (command.equals("markInsert")) {
			c = new MarkInsertController();
		} else if (command.equals("writeReview")) {
			c = new WriteReviewController();
		} else if (command.equals("MarkDelete")) {
			c = new MarkDeleteController();
		} else if (command.equals("adminMember")) {
			c = new AdminMemberController();
		} else if (command.equals("deleteMember")) {
			c = new DeleteMemberController();
		} else if (command.equals("adminStore")) {
			c = new AdminStoreListController();
		} else if (command.equals("modify")) {
			c = new AdminStoreModifyController();
		} else if (command.equals("edit")) {
			c = new AdminStoreEditController();
		} else if (command.equals("adminStoredelete")) {
			c = new AdminStoreDeleteController();
		} else if (command.equals("grantMember")) {
			c = new GrantMemberController();
		} else if (command.equals("showMyReview")) {
			c = new ShowMyReviewController();
		} else if (command.equals("myReviewDelete")) {
			c = new MyReviewDeleteController();
		} else if (command.equals("insertStore")) {
			c = new AdminStoreInsertController();
		}else if(command.equals("storeNameCheck")){
			c = new StoreNameCheckController();
		}
		return c;
	}
}
