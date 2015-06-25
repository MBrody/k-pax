package uoc.edu.svrKpax.bussines;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import uoc.edu.svrKpax.dao.CategoryDao;
import uoc.edu.svrKpax.dao.GameDao;
import uoc.edu.svrKpax.dao.GameViewDao;
import uoc.edu.svrKpax.dao.UserDao;
import uoc.edu.svrKpax.util.IntegerWrapper;
import uoc.edu.svrKpax.util.Security;
import uoc.edu.svrKpax.vo.Game;
import uoc.edu.svrKpax.vo.GameView;
import uoc.edu.svrKpax.vo.GamePagination;
import uoc.edu.svrKpax.vo.User;


public class GameBOImp implements GameBO {

	private SessionBO sBo;
	private GameDao gDao;
	private UserDao uDao;
	private GameViewDao gvDao;
	private CategoryDao cDao;

	@Override
	public List<Game> listGames(String campusSession) {

		if (sBo.validateSession(campusSession) != null) {
			return gDao.getAllGames();
		}

		return null;
	}

	@Override
	public List<Game> listGames(String campusSession, int idOrderer, int idFilterer, List<String> fields, List<String> values) {

		if (sBo.validateSession(campusSession) != null) {
			
			//Transform fields and values into Map
			if(fields.size() != values.size())
				return null;
			Map <String, String> fields_values = new HashMap <String, String>();
			for(int i = 0; i < fields.size(); i++)
			{
				String field = fields.get(i);
				if(field != null && !field.trim().equals(""))
				{
					fields_values.put(field, values.get(i)); //No duplicated fields validation. Will be overwritten.
				}
			}
			
			/*---- Validating fields and values -----*/
			try
			{
				switch (idFilterer)
				{
					case 1: // By category.
						if(!fields_values.containsKey("idCategory") || 
							fields_values.get("idCategory").trim().equals(""))
						{
							return null;
						}
						Integer.parseInt(fields_values.get("idCategory"));
						break;
					case 2: // By game name.
						if(!fields_values.containsKey("name") || 
							fields_values.get("name").trim().equals(""))
						{
							return null;
						}
						break;
					case 3: // By similar games.
						if(!fields_values.containsKey("idGame") || 
							fields_values.get("idGame").trim().equals(""))
						{
							return null;
						}
						Integer.parseInt(fields_values.get("idGame"));
						break;
				}
			}
			catch(NumberFormatException e)
			{
				return null;
			}
			
			//Getting the list
			List<GameView> gamesView = gvDao.getAllGameViews(idFilterer, idOrderer, fields_values);
			if(gamesView == null)
				return null;
			
			//Transform GameView list into GameList for returning
			List<Game> games = new ArrayList <Game>();
			for(GameView gameView: gamesView)
			{
				games.add(GameView.getGame(gameView));
			}
			return games;
		}

		return null;
	}

	@Override
	public Boolean addGame(
			String campusSession
			,String nameGame
			//,int idGame
			,String username
			,int idCategory
			,int idPlatform
			,int idSkill
			//,int Access
			,String urlImage
			,String csrfile
			//,Date dateCreation
			,String descripGame
			) {
		try {
			//Add the game if user exists, game does not exists, there is a name, there is a creation date and category exists
			if (
					sBo.validateSession(campusSession) != null &&
					//gDao.getGame(idGame) == null &&
					cDao.getCategory(idCategory) != null &&
					//uDao.getUserForUserName(username) != null &&
					gDao.getGameByName(nameGame) == null &&
					!nameGame.equals(""))
			{
				//TODO: Fails on geting user from name
				//User objUser = uDao.getUserForUserName(username);
				Game objGame = new Game();
				//objGame.setIdGame(idGame); 
				objGame.setName(nameGame);
				objGame.setSecretGame(Security.getIdGame());
				objGame.setPrivateKey(Security.getIdSession());
				//objGame.setIdDeveloper(objUser.getIdUser());
				objGame.setIdDeveloper(6);
				objGame.setIdCategory(idCategory);
				objGame.setIdPlatform(idPlatform);
				objGame.setIdSkill(idSkill);
				objGame.setPublicAcces(0);
				objGame.setUrlImage(urlImage);
				objGame.setCsr_file(csrfile);
				//objGame.setDateCreation(dateCreation);
				objGame.setDescripGame(descripGame);
				gDao.addGame(objGame);
			}
			else
				return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	@Override
	public Boolean setGame(
			String campusSession
			,String nameGame
			,int idGame
			,String username
			,int idCategory
			,int idPlatform
			,int idSkill
			,int Access
			,String urlImage
			,String csrfile
			//,Date dateCreation
			,String descripGame
			) {
		try {
			//Add the game if user exists, game does not exists, there is a name, there is a creation date and category exists
			if (
					//TODO: test if game name is duplicate
					sBo.validateSession(campusSession) != null &&
					gDao.getGame(idGame) != null &&
					cDao.getCategory(idCategory) != null &&
					!nameGame.equals(""))
			{
				//User objUser = null;
				//objUser = uDao.getUserForUserName(username);

				Game objGame = new Game();
				objGame.setIdGame(idGame); 
				objGame.setName(nameGame);
				objGame.setSecretGame(Security.getIdGame());
				objGame.setPrivateKey(Security.getIdSession());
				//TODO: Fails on geting userid from name
				//objGame.setIdDeveloper(objUser.getIdUser());
				objGame.setIdDeveloper(6);
				
				objGame.setIdCategory(idCategory);
				objGame.setIdPlatform(idPlatform);
				objGame.setIdSkill(idSkill);
				objGame.setPublicAcces(Access);
				objGame.setUrlImage(urlImage);
				objGame.setCsr_file(csrfile);
				//objGame.setDateCreation(dateCreation);
				objGame.setDescripGame(descripGame);
				gDao.addGame(objGame);
			}
			else
				return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	@Override
	public Boolean delGame(String campusSession, int idGame) {
		try {
			if (sBo.validateSession(campusSession) != null) {
				//TODO Delete all dependencies: comments, tags, likeGames, instances, records...
				Game objGame = gDao.getGame(idGame);
				gDao.delGame(objGame);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public Game getGame(String idGame,String campusSession) {
		Game objGame = null;

		try {
			if (Security.isIdGame(idGame))
				objGame = gDao.getGameUid(idGame);
			else{
				if(sBo.validateSession(campusSession)!=null){
					objGame = gDao.getGame(Integer.parseInt(idGame));
				}else{
					return null;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return objGame;
	}

	@Override
	public GamePagination listGamesSearch(String campusSession, String text, Integer offset, Integer limit) {
		if (sBo.validateSession(campusSession) != null) {
			GamePagination gamepagination = new GamePagination();
			IntegerWrapper total = new IntegerWrapper();
			gamepagination.setGames(gDao.getGamesSearch(text, offset, limit, total));
			gamepagination.setOffset(offset);
			gamepagination.setLimit(limit);
			gamepagination.setTotal(total);
			return gamepagination;
		}

		return null;
	}
	
	@Override
	public List<Game> listSimilarGames(String campusSession, String idGame){
		if (sBo.validateSession(campusSession) != null) {
			return gDao.getSimilarGames(idGame);
		}

		return null;
	}
	
	public void setgDao(GameDao gDao) {
		this.gDao = gDao;
	}

	public GameDao getgDao() {
		return gDao;
	}

	public SessionBO getsBo() {
		return sBo;
	}

	public void setsBo(SessionBO sBo) {
		this.sBo = sBo;
	}

	public GameViewDao getGvDao() {
		return gvDao;
	}

	public void setGvDao(GameViewDao gvDao) {
		this.gvDao = gvDao;
	}

	public CategoryDao getcDao() {
		return cDao;
	}

	public void setcDao(CategoryDao cDao) {
		this.cDao = cDao;
	}
	
	public UserDao getuDao() {
		return uDao;
	}

	public void setuDao(UserDao uDao) {
		this.uDao = uDao;
	}
	
}