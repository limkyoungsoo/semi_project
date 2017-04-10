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
		} else if(command.equals("updateMemberInfo")){
			c= new UpdateMemberInfoController();
		}
		return c;
	}
}
