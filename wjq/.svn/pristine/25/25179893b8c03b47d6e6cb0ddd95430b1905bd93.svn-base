package com.mvc.cms.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mvc.base.service.KeyWordsManager;
import com.mvc.cms.model.Channel;
import com.mvc.cms.model.Content;
import com.mvc.cms.model.ContentChannel;
import com.mvc.cms.model.ContentTxt;
import com.mvc.framework.service.BaseService;
import com.mvc.framework.util.DateUtils;
import com.mvc.framework.util.PageSearch;
import com.mvc.security.model.User;
import com.mvc.security.service.UserManager;

/**
 * 内容
 */
@Service
public class ContentManager extends BaseService<Content, Long> {

	private static final Logger LOGGER = Logger.getLogger(ContentManager.class);

	@Autowired
	private UserManager userManager;
	@Autowired
	private ContentChannelManager contentChannelManager;
	@Autowired
	private TagManager tagManager;
	@Autowired
	private ContentTxtManager contentTxtManager;
	@Autowired
	private ChannelManager channelManager;
//	@Autowired
//	private HtmlGeneratorManager htmlGeneratorManager;
	@Autowired
	private KeyWordsManager keyWordsManager;

	/**
	 * 分页用
	 */
	@SuppressWarnings("unchecked")
    public List<Content> getChannelContent(Channel channel, Integer begin,
			Integer limited) {
	    if(channel==null){
	        return new ArrayList<Content>();
	    }
		String sql = "SELECT A FROM " + Content.class.getName() + " A, "
				+ ContentChannel.class.getName()
				+ " B WHERE A.objectId = B.contentId and B.channelId = "
				+ channel.getObjectId() + "  AND A.status="
				+ Content.CONTENT_STATUS_PUBLISH
				+ " ORDER BY A.publishDate desc";
		Session session = getSession();
		Query query = session.createQuery(sql);
		if (null != begin) {
			query.setFirstResult(begin);
		}
		if (null != limited) {
			query.setMaxResults(limited);
		}
		List<Content> list = query.list();
		fillParentPath(channel, list);
		return list;
	}


	@SuppressWarnings("unchecked")
    public void getChannelContent(PageSearch pageSearch,Channel channel,int start) {
	    if(channel==null){
            return;
        }
        int currentPage = pageSearch.getPage()<=0?1:pageSearch.getPage();
        int pageSize = pageSearch.getPageSize();
        int begin = (currentPage-1)*pageSize+start;
        List<Content> list = getChannelContent(channel, begin, pageSize);
        pageSearch.setList(list);
        String sql = "SELECT count(*) FROM " + Content.class.getName() + " A, "
                + ContentChannel.class.getName()
                + " B WHERE A.objectId = B.contentId and B.channelId = "
                + channel.getObjectId() + "  AND A.status="
                + Content.CONTENT_STATUS_PUBLISH
                + " ORDER BY A.publishDate desc";
        Session session = getSession();
        Query query = session.createQuery(sql);
        List<Long> countList = query.list();
        if(countList.size()>0){
            pageSearch.setTotalCount(countList.get(0).intValue()-start);
        }else{
            pageSearch.setTotalCount(0);
        }
    }

	public Content getContentWithTxt(Long id) {
		Content content = super.getByObjectId(id);
		if (null != content) {
			ContentTxt contentTxt = contentTxtManager
					.getContentTxtByContentId(content.getObjectId());
			content.setContentTxt(contentTxt);
		}
		return content;
	}

	/**
	 * 推荐的文章
	 */

	@SuppressWarnings("unchecked")
    public List<Content> getRecommendContent(Integer siteId, Integer limited) {
		String sql = "SELECT A FROM " + Content.class.getName() + " A, "
				+ Channel.class.getName() + " B, "
				+ ContentChannel.class.getName() + "  C "
				+ " WHERE B.siteId = " + siteId + " AND A.recStatus = 1  "
				+ " AND A.objectId = C.contentId "
				+ " AND B.objectId = C.channelId  " + " AND B.recStatus = 1 "
				+ " AND A.isRecommend = 1 AND A.status="
				+ Content.CONTENT_STATUS_PUBLISH
				+ " ORDER BY A.topLevel DESC,A.createdOn desc";
		Session session = getSession();
		Query query = session.createQuery(sql);
		if (null != limited) {
			query.setMaxResults(limited);
		}
		List<Content> list = query.list();
		session.close();
		fillParenPath(list);
		return list;
	}
    @SuppressWarnings("unchecked")
	public List<Content> getRecommendContent(Channel channel, Integer limited) {
		String sql = "SELECT A FROM " + Content.class.getName() + " A, "
				+ ContentChannel.class.getName()
				+ " B WHERE A.objectId = B.contentId and B.channelId = "
				+ channel.getObjectId()
				+ " AND A.recStatus = 1 and A.isRecommend = 1 AND A.status="
				+ Content.CONTENT_STATUS_PUBLISH + " ORDER BY A.createdOn desc";
		Session session = getSession();
		Query query = session.createQuery(sql);
		if (null != limited) {
			query.setMaxResults(limited);
		}
        List<Content> list = query.list();
		session.close();
		fillParentPath(channel, list);
		return list;
	}
    @SuppressWarnings("unchecked")
	public List<Content> getRecommendContent(List<Channel> channels,
			Integer limited) {
		List<Content> contents = new ArrayList<Content>(limited);
		for (Channel channel : channels) {
			String sql = "SELECT A FROM " + Content.class.getName() + " A, "
					+ ContentChannel.class.getName()
					+ " B WHERE A.objectId = B.contentId and B.channelId = "
					+ channel.getObjectId()
					+ " AND A.recStatus = 1 and A.isRecommend = 1 AND "
					+ "A.status=" + Content.CONTENT_STATUS_PUBLISH
					+ " ORDER BY A.topLevel DESC,A.createdOn desc";
			Session session = getSession();
			Query query = session.createQuery(sql);
			if (null != limited) {
				query.setMaxResults(limited);
			}
            List<Content> list = query.list();
			session.close();
			fillParentPath(channel, list);
			contents.addAll(list);
		}
		return contents;
	}

	/**
	 * 最新的文章
	 */
    @SuppressWarnings("unchecked")
	public List<Content> getLatestContent(Integer siteId, Integer limited) {
		String sql = "SELECT A FROM " + Content.class.getName() + " A, "
				+ Channel.class.getName() + " B, "
				+ ContentChannel.class.getName() + "  C "
				+ " WHERE B.siteId = " + siteId + " AND A.recStatus = 1  "
				+ " AND A.objectId = C.contentId "
				+ " AND B.objectId = C.channelId "
				+ "AND B.recStatus = 1 and A.isRecommend=0 AND A.status="
				+ Content.CONTENT_STATUS_PUBLISH
				+ " ORDER BY A.topLevel DESC,A.publishDate desc";
		Session session = getSession();
		Query query = session.createQuery(sql);
		if (null != limited) {
			query.setMaxResults(limited);
		}
        List<Content> list = query.list();
		session.close();
		fillParenPath(list);
		return list;
	}

	@SuppressWarnings("unchecked")
    public List<Content> getLatestContentTwo(Integer siteId, Integer limited) {
		String sql = "SELECT A FROM " + Content.class.getName() + " A, "
				+ Channel.class.getName() + " B, "
				+ ContentChannel.class.getName() + "  C "
				+ " WHERE B.siteId = " + siteId + " AND A.recStatus = 1  "
				+ " AND A.objectId = C.contentId "
				+ " AND B.objectId = C.channelId "
				+ "AND B.recStatus = 1 and A.isRecommend=0 AND A.status="
				+ Content.CONTENT_STATUS_PUBLISH
				+ " ORDER BY A.topLevel DESC,A.createdOn desc";
		Session session = getSession();
		Query query = session.createQuery(sql);
		if (null != limited) {
			query.setMaxResults(limited);
		}
		List<Content> list = query.list();
		session.close();
		fillParenPath(list);
		return list;
	}

	private void fillParenPath(List<Content> list) {
		for (Content content : list) {
			List<Channel> channels = channelManager.getContentChannels(content
					.getObjectId());
			content.setParentPath(channels.get(0).getPath());
		}
	}

	@SuppressWarnings("unchecked")
    public List<Content> getLatestContent(Channel channel, Integer limited) {
		String sql = "SELECT A FROM " + Content.class.getName() + " A, "
				+ ContentChannel.class.getName()
				+ " B WHERE A.objectId = B.contentId and B.channelId = "
				+ channel.getObjectId()
				+ " AND A.recStatus = 1 and A.isRecommend = 0 AND A.status="
				+ Content.CONTENT_STATUS_PUBLISH
				+ " ORDER BY A.topLevel DESC,A.createdOn desc";
		Session session = getSession();
		Query query = session.createQuery(sql);
		if (null != limited) {
			query.setMaxResults(limited);
		}
		List<Content> list = query.list();
		session.close();
		fillParentPath(channel, list);
		return list;
	}

	private void fillParentPath(Channel channel, List<Content> list) {
		for (Content content : list) {
			content.setParentPath(channel.getPath());
		}
	}

	@SuppressWarnings("unchecked")
    public List<Content> getLatestContent(List<Channel> channels,
			Integer limited) {
		List<Content> contents = new ArrayList<Content>(limited);
		for (Channel channel : channels) {
			String sql = "SELECT A FROM "
					+ Content.class.getName()
					+ " A, "
					+ ContentChannel.class.getName()
					+ " B WHERE A.objectId = B.contentId and B.channelId = "
					+ channel.getObjectId()
					+ " AND A.recStatus = 1 and A.isRecommend = 0 AND A.status="
					+ Content.CONTENT_STATUS_PUBLISH
					+ " ORDER BY A.topLevel DESC,A.publishDate desc";
			Session session = getSession();
			Query query = session.createQuery(sql);
			if (null != limited) {
				query.setMaxResults(limited);
			}
			List<Content> list = query.list();
			session.close();
			fillParentPath(channel, list);
			contents.addAll(list);
		}
		return contents;
	}

	@SuppressWarnings("unchecked")
    public List<Content> getLatestContentTwo(List<Channel> channels,
			Integer limited) {
		List<Content> contents = new ArrayList<Content>(limited);
		for (Channel channel : channels) {
			String sql = "SELECT A FROM "
					+ Content.class.getName()
					+ " A, "
					+ ContentChannel.class.getName()
					+ " B WHERE A.objectId = B.contentId and B.channelId = "
					+ channel.getObjectId()
					+ " AND A.recStatus = 1 and A.isRecommend = 0 AND A.status="
					+ Content.CONTENT_STATUS_PUBLISH
					+ " ORDER BY A.topLevel DESC,A.createdOn desc";
			Session session = getSession();
			Query query = session.createQuery(sql);
			if (null != limited) {
				query.setMaxResults(limited);
			}
			List<Content> list = query.list();
			session.close();
			fillParentPath(channel, list);
			contents.addAll(list);
		}
		return contents;
	}

	public boolean hasChannel(Long[] channelIds) {
		boolean result = false;
		if (channelIds != null) {
			for (Long id : channelIds) {
				if (null != id) {
					result = true;
					break;
				}
			}
		}
		return result;
	}

//	/**
//	 * 最热的文章
//	 */
//	public List<Content> getHottestContent(Channel channel, Integer limited) {
//		String sql = "SELECT distinct A FROM "
//				+ Content.class.getName()
//				+ " A, "
//				+ ContentChannel.class.getName()
//				+ " B, "
//				+ ContentCount.class.getName()
//				+ " C WHERE A.objectId = B.contentId and B.channelId = "
//				+ channel.getObjectId()
//				+ " AND A.recStatus = 1 AND A.objectId = C.contentId  AND A.status="
//				+ Content.CONTENT_STATUS_PUBLISH + " ORDER BY A.topLevel DESC";
//		Session session = getSession();
//		Query query = session.createQuery(sql);
//		if (null != limited) {
//			query.setMaxResults(limited);
//		}
//		List<Content> list = query.list();
//		session.close();
//		fillParentPath(channel, list);
//		return list;
//	}

//	public List<Content> getHottestContent(Integer siteId, Integer limited) {
//		String sql = "SELECT A FROM "
//				+ Content.class.getName()
//				+ " A, "
//				+ ContentCount.class.getName()
//				+ " B,"
//				+ ContentChannel.class.getName()
//				+ " C,"
//				+ Channel.class.getName()
//				+ " D "
//				+ " WHERE A.objectId = C.contentId and D.objectId = C.channelId "
//				+ " and D.siteId = " + siteId
//				+ " AND A.objectId = B.contentId "
//				+ " and A.recStatus = 1 and B.recStatus = 1"
//				+ " and D.recStatus = 1  AND A.status="
//				+ Content.CONTENT_STATUS_PUBLISH
//				+ " order by A.topLevel DESC,B.viewsWeek desc ";
//		Session session = getSession();
//		Query query = session.createQuery(sql);
//		if (null != limited) {
//			query.setMaxResults(limited);
//		}
//		List<Content> list = query.list();
//		session.close();
//		fillParenPath(list);
//		return list;
//	}

//	public List<Content> getHottestContent(List<Channel> channels,
//			Integer limited) {
//		List<Content> contents = new ArrayList<Content>(limited);
//		for (Channel channel : channels) {
//			String sql = "SELECT A FROM "
//					+ Content.class.getName()
//					+ " A, "
//					+ ContentChannel.class.getName()
//					+ " B, "
//					+ ContentCount.class.getName()
//					+ " C WHERE A.objectId = B.contentId and B.channelId in("
//					+ channel.getObjectId()
//					+ ") AND A.recStatus = 1 AND C.recStatus = 1 AND A.objectId = C.contentId AND A.status="
//					+ Content.CONTENT_STATUS_PUBLISH
//					+ " orderBy A.topLevel DESC,C.viewsWeek desc";
//			Session session = getSession();
//			Query query = session.createQuery(sql);
//			if (null != limited) {
//				query.setMaxResults(limited);
//			}
//			List<Content> list = query.list();
//			session.close();
//			fillParentPath(channel, list);
//			contents.addAll(list);
//		}
//		return contents;
//	}

	/**
	 * 相关的文章
	 */
//	public List<Content> getRelativeContent(Long contentId, Channel channel,
//			Integer limited) {
//		String sql = "SELECT distinct A FROM "
//				+ Content.class.getName()
//				+ " A, "
//				+ ContentChannel.class.getName()
//				+ " B WHERE A.recStatus = 1 AND A.objectId = B.contentId and B.channelId = "
//				+ channel.getObjectId()
//				+ " AND A.objectId in (select C.contentId from "
//				+ ContentTag.class.getName() + " C,"
//				+ ContentTag.class.getName()
//				+ " D where C.tagId = D.tagId AND D.contentId = " + +contentId
//				+ " AND C.contentId != " + contentId + ")  AND A.status="
//				+ Content.CONTENT_STATUS_PUBLISH
//				+ " ORDER BY A.topLevel DESC,A.createdOn desc";
//		Session session = getHibernateTemplate().getSessionFactory()
//				;
//		Query query = session.createQuery(sql);
//		if (null != limited) {
//			query.setMaxResults(limited);
//		}
//		List<Content> list = query.list();
//		session.close();
//		fillParentPath(channel, list);
//		return list;
//	}

	public void saveContentChannel(String[] channelIds, Content entity) {
		contentChannelManager.deleteByWhere("contentId = "
				+ entity.getObjectId());
		if (null != channelIds) {
			for (String channelId : channelIds) {
				if (channelId != null && !"".equals(channelId)) {
					ContentChannel contentChannel = new ContentChannel();
					contentChannel.setChannelId(Long.parseLong(channelId));
					contentChannel.setContentId(entity.getObjectId());
					contentChannelManager.save(contentChannel);
//					Channel channel = channelManager.getByObjectId(Long
//							.valueOf(channelId));
//					Site site = siteManager
//							.getSiteBySiteId(channel.getSiteId());
//					Map root = htmlGeneratorManager.getRoot(site, channel);
//					// create static page in save contentChannel;
//					detailHtmlManager.runGenerate(channel, entity, root);
				}
			}
		}
		// if(entity.getStatus() == Content.CONTENT_STATUS_PUBLISH){
		// runProductHtml(channelIds);
		// }
	}

//	public void saveProductHtml(String[] channelIds) {
//		if (null != channelIds) {
//			for (String channelId : channelIds) {
//				if (channelId != null && !"".equals(channelId)) {
//					htmlGeneratorManager.channelIndex(3,Long.valueOf(channelId));
//					Channel channel = channelManager.getByObjectId(Long.valueOf(channelId));
//					if (channel != null && channel.getParentId() != null) {
//						htmlGeneratorManager.channelIndex(3,Long.valueOf(channel.getParentId()));
//						Channel channel2 = channelManager.getByObjectId(Long.valueOf(channel.getParentId()));
//						if (channel2 != null && channel2.getParentId() != null) {
//							htmlGeneratorManager.channelIndex(3,Long.valueOf(channel2.getParentId()));
//							Channel channel3 = channelManager.getByObjectId(Long.valueOf(channel2.getParentId()));
//
//						}
//					}
//				}
//			}
//		}
//		Channel channel = channelManager.getChannelByName(3, "塘桥首页");
//		htmlGeneratorManager.channelIndex(channel.getSiteId(),channel.getObjectId());
//	}

	public void save(Content entity, String[] menuIds) {
		ContentTxt contentTxt = null;
		if (null != entity.getObjectId()) {
			contentTxt = contentTxtManager.getContentTxtByContentId(entity
					.getObjectId());
		}else{
			entity.setObjectId(createSystemId());
		}
		if (null == contentTxt) {
			contentTxt = new ContentTxt();
			contentTxt.setContentId(entity.getObjectId());
		}
		try {
			String newContent = setContent(entity);
//			contentFileBackupManager.saveContentPicture(newContent,
//					entity.getObjectId());
			contentTxt.setTxt(newContent);
			if (entity.getCreateDate() == null) {
				entity.setCreateDate(new Date());
			}
			save(entity);
			contentTxtManager.save(contentTxt);
//			 saveTag(entity);
			saveContentChannel(menuIds, entity);
		} catch (Exception e) {
			LOGGER.error(e);
		}
	}

	public void delete(Long objectId){
		super.delete(objectId);
		contentTxtManager.deleteByWhere("contentId="+objectId);
		contentChannelManager.deleteByWhere("contentId="+objectId);
	}

//	private void saveTag(Content entity) {
//		if (null != entity.getTag() && !"".equals(entity.getTag())) {
//			String[] tags = entity.getTag().split(",");
//			List<Long> tagIds = new ArrayList<Long>();
//			List<Tag> oldTags = tagManager.getTagsByContentId(entity
//					.getObjectId());
//			int i = 0;
//			for (String tagInfo : tags) {
//				boolean has = false;
//				for (Tag tag : oldTags) {
//					if (tag.getName().equals(tagInfo)) {
//						has = true;
//						tagIds.add(tag.getObjectId());
//						break;
//					}
//				}
//				if (!has) {
//					Tag tag = new Tag();
//					tag.setName(tagInfo);
//					tagManager.save(tag);
//					ContentTag contentTag = new ContentTag();
//					contentTag.setContentId(entity.getObjectId());
//					contentTag.setTagId(tag.getObjectId());
//					contentTag.setPriority(++i);
//					contentTagManager.save(contentTag);
//					tagIds.add(tag.getObjectId());
//				}
//			}
//			contentTagManager.deleteContentTag(entity.getObjectId(), tagIds);
//		}
//	}
//
	private String setContent(Content entity) throws Exception {
		String content = entity.getContentTxt().getTxt();
//		List<KeyWords> keyWordsList = keyWordsManager.getAll();
//		for (KeyWords temp : keyWordsList) {
//			content = content.replace(temp.getName(),"");
//		}
		return content;
	}

	@Override
    public List<Content> getAll() {
		String sql = "SELECT A FROM " + Content.class.getName()
				+ " A WHERE 1 = 1" ;
		List<Content> contents = searchBySql(Content.class, sql);
		return contents;
	}

//	public Integer updateStatus(Long contentId, int status) {
//		String sql = "update " + Content.class.getName() + " a set a.status = "
//				+ status + " where objectId = " + contentId
//				+ " and recStatus = " + AuditableEntity.REC_STATUS_VALID;
//		Session session = getHibernateTemplate().getSessionFactory()
//				;
//		Query query = session.createQuery(sql);
//		int result = query.executeUpdate();
//		session.close();
//		return result;
//	}

//	public void updateRelativePath(Long contentId, String relativePath) {
//		String sql = "update " + Content.class.getName()
//				+ " a set a.relativePath = '" + relativePath
//				+ "' where objectId = " + contentId + " and recStatus = "
//				+ AuditableEntity.REC_STATUS_VALID;
//		Session session = getHibernateTemplate().getSessionFactory()
//				;
//		Query query = session.createQuery(sql);
//		query.executeUpdate();
//		session.close();
//	}

//	public List<Content> searchContentByTag(String tag, Integer siteId,
//			Integer begin, Integer limited) {
//		String sql = "SELECT A FROM " + Content.class.getName() + " A,"
//				+ Channel.class.getName() + " B,"
//				+ ContentChannel.class.getName() + " C"
//				+ " WHERE  A.objectId in (" + "SELECT D.contentId FROM "
//				+ ContentTag.class.getName() + " D," + Tag.class.getName()
//				+ " E " + "WHERE D.tagId = E.objectId AND E.name = '" + tag
//				+ "')  "
//				+ "AND A.objectId = C.contentId AND B.objectId = C.channelId "
//				+ " AND A.recStatus = 1 AND B.recStatus = 1 AND A.status="
//				+ Content.CONTENT_STATUS_PUBLISH + " AND B.siteId = " + siteId
//				+ " ORDER BY A.topLevel DESC,A.createdOn desc";
//		Session session = getHibernateTemplate().getSessionFactory()
//				;
//		Query query = session.createQuery(sql);
//		if (null != begin) {
//			query.setFirstResult(begin);
//		}
//		if (null != limited) {
//			query.setMaxResults(limited);
//		}
//		List<Content> list = query.list();
//		session.close();
//		fillParenPath(list);
//		return list;
//	}

//	public List<Content> getNullRelativeContent(Long channelId) {
//		String sql = "SELECT A FROM "
//				+ Content.class.getName()
//				+ " A,"
//				+ ContentChannel.class.getName()
//				+ " B WHERE A.recStatus = 1 AND A.objectId = B.contentId and B.channelId = "
//				+ channelId + " AND A.relativePath is null";
//		Session session = getHibernateTemplate().getSessionFactory()
//				;
//		Query query = session.createQuery(sql);
//		List<Content> list = query.list();
//		session.close();
//		return list;
//	}

//	public void createTag() {
//		List<Content> contents = getAll();
//		StatelessSession session = getHibernateTemplate().getSessionFactory()
//				.openStatelessSession();
//		Transaction tx = session.beginTransaction();
//		List<Tag> tags = tagManager.getAll();
//		int total = 0;
//		for (Content content : contents) {
//			String s = content.getTag() + ",";
//			if (s != null && !"".equals(s)) {
//				int count = s.split(",").length;
//				for (Tag tag : tags) {
//					if (s.trim().contains(tag.getName().trim() + ",")) {
//						ContentTag contentTag = new ContentTag();
//						contentTag.setContentId(content.getObjectId());
//						contentTag.setTagId(tag.getObjectId());
//						session.insert(contentTag);
//						if (total % 10000 == 0) {
//							tx.commit();
//							tx = session.beginTransaction();
//						}
//						count--;
//						total++;
//					}
//					if (count == 0) {
//						break;
//					}
//				}
//			}
//		}
//		tx.commit();
//		session.close();
//	}
//
//	public List<Content> find(Integer siteId, String searchContent,
//			PageSearch page) {
//		Session session = getSession();
//		Criteria criteria = HibernateWebUtils.createCriteria(session,
//				page.getEntityClass(), page.getFilters());
//		criteria.add(Restrictions
//				.sqlRestriction(" "
//						+ "OBJECT_ID IN (SELECT A.OBJECT_ID FROM CMS_CHANNEL B , CMS_CONTENT_CHANNEL C,CMS_CONTENT A WHERE B.SITE_ID = "
//						+ siteId
//						+ " AND B.REC_STATUS = 1 AND A.STATUS = "
//						+ Content.CONTENT_STATUS_PUBLISH
//						+ " AND C.CHANNEL_ID = B.OBJECT_ID AND A.REC_STATUS = 1 "
//						+ "AND A.OBJECT_ID = C.CONTENT_ID AND A.TITLE LIKE '%"
//						+ searchContent + "%' )"));
//		if (0 == page.getTotalCount()) {
//			criteria.setProjection(Projections.rowCount());
//			Object object = criteria.uniqueResult();
//			int total = object == null ? 0 : ((Integer) object).intValue();
//			page.setTotalCount(total);
//		}
//		page.setSortProperty("publishDate");
//		page.setSortOrder("desc");
//		if (page.getOrder() != null) {
//			criteria.addOrder(page.getOrder());
//		}
//		criteria.setProjection(null);
//		List<Content> items = criteria.setFirstResult(page.getBegin())
//				.setMaxResults(page.getPageSize()).list();
//		fillParenPath(items);
//		page.setList(items);
//		session.close();
//		return items;
//	}

	// 今日新增文章
	public Long getTodayContent() {
		StringBuilder sql = new StringBuilder(40);
		sql.append("SELECT COUNT(*) FROM ").append(Content.class.getName());
		sql.append(" A WHERE A.recStatus=? AND A.createdOn > ?");
		Session session = getSession();
		Query query = session.createQuery(sql.toString()).setParameter(0, 1)
				.setParameter(1, DateUtils.getBeginOfTheDate(new Date()));
		Long result = ((Long) query.iterate().next());
		session.close();
		return result;
	}

	// 待审核文章
	public Long getContentWithWaitCheck() {
		String sql = "select count(*) from " + Content.class.getName()
				+ " where 1 = 1"
				+ " AND status = " + Content.CONTENT_STATUS_WAIT_CHECK;
		Session session = getSession();
		Query query = session.createQuery(sql);
		Long result = ((Long) query.iterate().next());
		session.close();
		return result;
	}

//	public List<Content> getNotice(Integer siteId, Integer limited) {
//		List<Content> contents = new ArrayList<Content>(limited);
//		String sql = "SELECT A FROM "
//				+ Content.class.getName()
//				+ " A WHERE A.recStatus = 1 and A.isRecommend = 0 AND A.status="
//				+ Content.CONTENT_STATUS_PUBLISH + " AND type="
//				+ Content.CONTENT_TYPE_NOTICE + " ORDER BY A.createdOn desc";
//		Session session = getHibernateTemplate().getSessionFactory()
//				;
//		Query query = session.createQuery(sql);
//		if (null != limited) {
//			query.setMaxResults(limited);
//		}
//		List<Content> list = query.list();
//		session.close();
//		Channel channel = channelManager.getChannelByName(siteId, "公告");
//		fillParentPath(channel, list);
//		contents.addAll(list);
//		return contents;
//	}

	public List<Content> getAllNotice() {
		String sql = "SELECT A FROM " + Content.class.getName()
				+ " A WHERE A.type=" + Content.CONTENT_TYPE_NOTICE
				+ " AND A.recStatus = 1 AND A.status = "
				+ Content.CONTENT_STATUS_PUBLISH;
		List<Content> contents = searchBySql(Content.class, sql);
		return contents;
	}

	public List<Content> getBooks() {
		String sql = "SELECT A FROM " + Content.class.getName()
				+ " A WHERE  A.recStatus = 1 AND A.status = "
				+ Content.CONTENT_STATUS_PUBLISH;
		List<Content> contents = searchBySql(Content.class, sql);
		return contents;
	}

//	public void queryData(PageSearch page, Long userId, String where) {
//		String sql = "SELECT T FROM " + Content.class.getName() + " T WHERE "
//				+ where + " AND T.userId IN (SELECT F1.childUserId " + " FROM "
//				+ UserChild.class.getName() + " F1 WHERE F1.userId = " + userId
//				+ ") AND T.recStatus = 1 AND T.status = "
//				+ Content.CONTENT_STATUS_WAIT_CHECK;
//		Session session = getHibernateTemplate().getSessionFactory()
//				;
//		Query query = session.createQuery(sql.toString());
//		List<Object[]> list = query.list();
//		page.setTotalCount(list.size());
//		int end = page.getEnd() > page.getTotalCount() ? page.getTotalCount()
//				: page.getEnd();
//		list = list.subList(page.getBegin(), end);
//		page.setList(list);
//		session.close();
//	}

	public List<User> getUserByExamine() {
		String sql = "SELECT A from " + User.class.getName()
				+ " A WHERE A.type=" + Content.CONTENT_TYPE_ARTICAL
				+ " order by userName desc";
		return userManager.searchBySql(User.class, sql);
	}

	public List<User> getUserByCommon() {
		String sql = "SELECT A from " + User.class.getName()
				+ " A WHERE A.type<>" + Content.CONTENT_TYPE_ARTICAL
				+ "  order by type,userName desc";
		return userManager.searchBySql(User.class, sql);
	}

	@SuppressWarnings("rawtypes")
    public List queryTilteCount(String sql) {
		Session session = getSession()
				;
		SQLQuery query = session.createSQLQuery(sql);
		List list = query.list();
		session.close();
		return list;
	}

	public Content getContentByTag(String tag) {
		String sql = "select A from " + Content.class.getName()
				+ " A where tag=" + "'" + tag + "'";
		List<Content> list = searchBySql(Content.class, sql);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public List<Content> searchcontent(String keyword){
		List<Content> titles=null;
		String sql="SELECT * FROM CMS_CONTENT C WHERE C.title LIKE '%"+keyword+"%' AND c.status="+Content.CONTENT_STATUS_PUBLISH;
	    titles=searchByNativeSql(Content.class,sql);
		return titles;
	}
	public List<ContentTxt> searcharticle(Long objectId){
		List<ContentTxt> articles=null;
		String sql="SELECT * FROM CMS_CONTENT_TXT c WHERE c.content_id="+objectId;
		articles=searchByNativeSql(ContentTxt.class,sql);
		return articles;
	}

	@SuppressWarnings("unchecked")
    public void getTitle(PageSearch pageSearch,String keyword){
		String sql="SELECT count(*) FROM CMS_CONTENT C WHERE C.status="+Content.CONTENT_STATUS_PUBLISH;
		if(StringUtils.isNotEmpty(keyword)){
			sql=sql+" AND C.title LIKE '%"+keyword+"%'";
		}
		Session session = getSession();
	    Query query = session.createQuery(sql);
	    List<Long> countList = query.list();
        if(countList.size()>0){
            pageSearch.setTotalCount(countList.get(0).intValue());
        }else{
            pageSearch.setTotalCount(0);
        }


		int  currentPage=pageSearch.getPage()<=0?1:pageSearch.getPage();
		int pageSize = pageSearch.getPageSize();
        int begin = (currentPage-1)*pageSize;
        List<Content> list= getAllTitle(keyword,begin,pageSize);
        pageSearch.setList(list);

	}
    @SuppressWarnings("unchecked")
	public List<Content> getAllTitle(String keyword,Integer begin,Integer limited){
    	String sql=null;
		if(StringUtils.isNotEmpty(keyword)){
		    sql="SELECT C FROM CMS_CONTENT C WHERE C.status="+Content.CONTENT_STATUS_PUBLISH;
			sql=sql+" AND C.title LIKE '%"+keyword+"%'"+"OR C.keyWords LIKE '%"+keyword+"%'"+"ORDER BY C.publishDate desc";
		}else{
			sql="SELECT C FROM CMS_CONTENT C WHERE C.status="+Content.CONTENT_STATUS_PUBLISH+ "ORDER BY C.publishDate desc";
		}
		Session session = getSession();
		Query query = session.createQuery(sql);
		if (null != begin) {
			query.setFirstResult(begin);
		}
		if (null != limited) {
			query.setMaxResults(limited);
		}
        List<Content> list = query.list();
		return list;
	}

	public void updateContentVisitorNum(Long objectId){
		String sql=" UPDATE CMS_CONTENT  SET visitor_Count=visitor_Count+1 WHERE object_id="+objectId;
		getSession().createSQLQuery(sql).executeUpdate();
	}
}