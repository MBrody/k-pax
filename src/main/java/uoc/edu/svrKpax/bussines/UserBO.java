package uoc.edu.svrKpax.bussines;

import javax.ws.rs.core.Response;

import uoc.edu.svrKpax.vo.User;


public interface UserBO {
	
	public Response initUserUOC(String username, String password, String alias) ;
	public int validateUserUOC(String campusSession);
	
	public Response initUserELGG(String username, String password);
	public Response initSignELGG(String username,String apikey);
	
	public Response initUser(String username,String alias);
	public int validateUser(String uid) ;
	public User getUserFromName(String username);
	public User getUserFromId(int userId);

}

