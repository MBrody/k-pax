package uoc.edu.svrKpax.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.dao.support.DataAccessUtils;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import uoc.edu.svrKpax.vo.Tag;

public class TagDaoImpl extends HibernateDaoSupport implements TagDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Tag> getAllTagsGame(int idGame) {
		List<Tag> list = new ArrayList<Tag>();
		
		Criteria criteria = getSession().createCriteria(Tag.class, "tag");
		criteria.createAlias("tag.game", "game");
		criteria.add(Restrictions.eq("game.idGame", idGame));
		criteria.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
		list = criteria.list();
        return list;
	}

	@Override
	public Tag getTag(int idTag) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Tag.class);
		criteria.add(Restrictions.eq("idTag", idTag));
		return (Tag) DataAccessUtils.uniqueResult(getHibernateTemplate()
				.findByCriteria(criteria));
	}

	@Override
	public void addTagGame(Tag tag) {
		getHibernateTemplate().saveOrUpdate(tag);
	}

	@Override
	public void delTagGame(Tag tag) {
		getHibernateTemplate().delete(tag);
	}

}
