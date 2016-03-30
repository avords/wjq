package com.mvc.home.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.WJQConstants;
import com.mvc.base.model.Advert;
import com.mvc.base.model.CooperativeEnterprise;
import com.mvc.base.model.Links;
import com.mvc.base.model.VisitRecord;
import com.mvc.base.service.AdvertManager;
import com.mvc.base.service.CooperativeEnterpriseManager;
import com.mvc.base.service.LinksManager;
import com.mvc.base.service.VisitRecordManager;
import com.mvc.cms.model.Channel;
import com.mvc.cms.model.Content;
import com.mvc.cms.model.ContentTxt;
import com.mvc.cms.model.SystemConfig;
import com.mvc.cms.service.ChannelManager;
import com.mvc.cms.service.ContentManager;
import com.mvc.cms.service.ContentTxtManager;
import com.mvc.cms.service.SystemConfigManager;
import com.mvc.framework.util.IpUtils;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.util.PageUtils;
import com.mvc.member.model.Member;
import com.mvc.member.model.OnlineMessage;
import com.mvc.member.service.MemberManager;
import com.mvc.member.service.OnlineMessageManager;
import com.mvc.search.service.SensitivewordFilterManager;
import com.mvc.sns.model.Post;
import com.mvc.sns.service.PostManager;

@Controller
@RequestMapping("home/index")
public class HomeIndexController {
    @SuppressWarnings("unused")
    private static int START_TITLE= 1;
    private static int TOP_ARTICLE= 5;
    private static int NEWEST_POST_COUNT= 5;
    @Autowired
    private ChannelManager channelManager;
    @Autowired
    private ContentManager contentManager;
    @Autowired
    private ContentTxtManager contentTxtManager;

    @Autowired
    private OnlineMessageManager onlineMessageManager;
    @Autowired
    private SystemConfigManager systemConfigManager;

    @Autowired
    private LinksManager linksManager;

    @Autowired
    private CooperativeEnterpriseManager cooperativeEnterpriseManager;
    @Autowired
    private VisitRecordManager visitRecordManager;

    @Autowired
    private AdvertManager advertManager;

    @Autowired
    private SensitivewordFilterManager sensitivewordFilterManager;
    @Autowired
    private PostManager postManager;
    @Autowired
    private MemberManager memberManager;
    @RequestMapping("")
    public String index(HttpServletRequest request,HttpServletResponse response) throws Exception {
        //获取普通位置各个栏目信息
        List<Channel> channels = channelManager.getAllShowByDisplayLocation(Channel.CHANNEL_DISPLAYLOCATION_GENERAL);
        //跨境环境观景台 1
        Channel channel_1_1 = ChannelUtils.getChannelByPositionCode(channels, "1_1");
        //取四篇文章
        List<Content> channel_1_1_contents = contentManager.getChannelContent(channel_1_1, 0, 4);
        request.setAttribute("channel_1_1_contents", channel_1_1_contents);
        request.setAttribute("channel_1_1", channel_1_1);
        //分类市场群英会 2
        Channel channel_2 = ChannelUtils.getChannelByPositionCode(channels, "2");
        request.setAttribute("channel_2", channel_2);
        //跨境课堂            3
        Channel channel_3 = ChannelUtils.getChannelByPositionCode(channels, "3");
        request.setAttribute("channel_3", channel_3);
        //出国服务透视镜 4
        Channel channel_4 = ChannelUtils.getChannelByPositionCode(channels, "4");
        request.setAttribute("channel_4", channel_4);
        //业务指南等
        Channel channel_5 = ChannelUtils.getChannelByPositionCode(channels, "5");
        request.setAttribute("channel_5", channel_5);
        visitorCount(request);
        //获取友情链接和合作单位的所有信息
        List<Links> links=linksManager.getAll();
        List<CooperativeEnterprise> cooperativeEnterprises=cooperativeEnterpriseManager.getAll();
        request.setAttribute("links", links);
        request.setAttribute("cooperativeEnterprises", cooperativeEnterprises);
        //获取已发布的广告的所有信息
        List<Advert> bannerAdvert =advertManager.getPublishedAdertByPositionCode("index_1");
        request.setAttribute("bannerAdvert", bannerAdvert);
        return "home/index";

    }


    @RequestMapping("{channelId}")
    public String channel(HttpServletRequest request,@PathVariable Long channelId) throws Exception {
        PageSearch pageSearch = PageUtils.getPageSearch(request);
        Channel channel = channelManager.getByObjectId(channelId);
        if(channel!=null){
            request.setAttribute("parentModuleId", channel.getParentId());
            if(StringUtils.isNotBlank(channel.getPath())){
                return "redirect:"+channel.getPath();
            }else{
                //通过栏目得到文章的列表
                //取5篇最新的文章
                List<Content> topArticles = contentManager.getChannelContent(channel, 0, TOP_ARTICLE);
                //从第五篇开始分页
                contentManager.getChannelContent(pageSearch, channel,TOP_ARTICLE);
                request.setAttribute("topArticles", topArticles);
            }
        }
        //得到橋聊吧內容
        List<Post> newestPosts = postManager.getNewestPost(NEWEST_POST_COUNT);
        for(Post post:newestPosts){
            Member m = memberManager.getByObjectId(post.getMemberId());
            if(m!=null){
                post.setMemberLoginName(m.getName());
            }
        }
        request.setAttribute("newestPosts", newestPosts);
        request.setAttribute("moduleId", channelId);
        request.setAttribute("pageSearch", pageSearch);
        request.setAttribute("channel", channel);
        return "home/channel";
    }

    @RequestMapping("{channelId}/detail/{contentId}")
    public String detail(HttpServletRequest request,@PathVariable Long channelId, @PathVariable Long contentId) throws Exception {
        Channel channel = channelManager.getByObjectId(channelId);
        List<Channel> parentChannels = new ArrayList<Channel>();
        Content content = contentManager.getByObjectId(contentId);
        content.setContentTxt(contentTxtManager.getContentTxtByContentId(contentId));
        //得到栏目位置
        ChannelUtils.getParent(parentChannels, channel, channelManager.getAll());
        String ip=IpUtils.getRealIp(request);
        Long memberId=(Long)request.getSession().getAttribute(WJQConstants.MEMBER_ID);
        visitRecordManager.createVisitRecord(memberId,ip,VisitRecord.VISIT_CONTENT,contentId);
        Integer visitCount=visitRecordManager.queryVisitCount(contentId, VisitRecord.VISIT_CONTENT);
        content.setVisitorCount(visitCount);

        //得到橋聊吧內容
        List<Post> newestPosts = postManager.getNewestPost(NEWEST_POST_COUNT);
        for(Post post:newestPosts){
            Member m = memberManager.getByObjectId(post.getMemberId());
            if(m!=null){
                post.setMemberLoginName(m.getName());
            }
        }
        request.setAttribute("newestPosts", newestPosts);
        request.setAttribute("parentChannels", parentChannels);
        request.setAttribute("channel", channel);
        request.setAttribute("content", content);
        return "home/detail";
    }

    @RequestMapping("{channelId}/directDetail")
    public String directDetail(HttpServletRequest request,@PathVariable Long channelId) throws Exception {
        Channel channel = channelManager.getByObjectId(channelId);
        if(channel!=null){
            request.setAttribute("parentModuleId", channel.getParentId());
            if(StringUtils.isNotBlank(channel.getPath())){
                return "redirect:"+channel.getPath();
            }else{
                //通过栏目得到文章的列表
                List<Content> articles = contentManager.getChannelContent(channel, 0, 1);
                if(articles.size()>0){
                    Long contentId = articles.get(0).getObjectId();
                    Content content = contentManager.getByObjectId(contentId);
                    content.setContentTxt(contentTxtManager.getContentTxtByContentId(contentId));

                    String ip=IpUtils.getRealIp(request);
                    Long memberId=(Long)request.getSession().getAttribute(WJQConstants.MEMBER_ID);
                    visitRecordManager.createVisitRecord(memberId,ip,VisitRecord.VISIT_CONTENT,contentId);
                    Integer visitCount=visitRecordManager.queryVisitCount(contentId, VisitRecord.VISIT_CONTENT);
                    content.setVisitorCount(visitCount);
                    request.setAttribute("channel", channel);
                    request.setAttribute("content", content);
                }else{
                    return "redirect:/home/index";
                }
            }
        }
        return "home/directDetail";
    }

    @RequestMapping("/show")
    public String show(HttpServletRequest request){
   	    PageSearch pageSearch = PageUtils.getPageSearch(request);
   	    try {
   	    	String keyword=request.getParameter("keyword");
            String val=request.getParameter("val");
            request.setAttribute("val", val);
            request.setAttribute("keyWords", keyword);
            if(val.equals("资讯")){
                contentManager.getTitle(pageSearch,keyword);
                request.setAttribute("pageSearch", pageSearch);
            }
            return "cms/searchShow";
		} catch (Exception e) {
			return "redirect:/home/index";
		}
       }


    @RequestMapping("/content/{objectId}")
    public String content(HttpServletRequest request, HttpServletResponse response,@PathVariable Long objectId)
            throws Exception {
        List<ContentTxt> articles=contentManager.searcharticle(objectId);
        List<Channel> contentChannels=channelManager.getContentChannels(objectId);
        Channel channel=new Channel();
        if(contentChannels!=null&&contentChannels.size()>0){
            channel=contentChannels.get(0);
        }
        List<Channel> parentChannels = new ArrayList<Channel>();
        //得到栏目位置
        ChannelUtils.getParent(parentChannels, channel, channelManager.getAll());
        Content content=contentManager.getByObjectId(objectId);
        String ip=IpUtils.getRealIp(request);
        Long memberId=(Long)request.getSession().getAttribute(WJQConstants.MEMBER_ID);
        visitRecordManager.createVisitRecord(memberId,ip,VisitRecord.VISIT_CONTENT,objectId);
        Integer visitCount=visitRecordManager.queryVisitCount(objectId, VisitRecord.VISIT_CONTENT);
        content.setVisitorCount(visitCount);
        content.setContentTxt(articles.get(0));
        request.setAttribute("parentChannels", parentChannels);
        request.setAttribute("channel", channel);
        request.setAttribute("content", content);
        return "home/detail";
    }

    @RequestMapping("/saveOnlineMessage")
    public String saveOnlineMessage(HttpServletRequest request, HttpServletResponse response,ModelMap modelMap) throws Exception{
        OnlineMessage t=new OnlineMessage();
        String title=request.getParameter("title").toString();
        String content=request.getParameter("content").toString();
        //判断留言标题或内容是否含有敏感词
        if (sensitivewordFilterManager.isContaintSensitiveWord(title, SensitivewordFilterManager.minMatchTYpe)||sensitivewordFilterManager.isContaintSensitiveWord(content, SensitivewordFilterManager.minMatchTYpe)) {
            modelMap.addAttribute("isHaveSensitiveword", true);
        } else {
            t.setContent(content);
            t.setTitle(title);
            t.setOnlineMessageDate(new Date());
            if(request.getSession().getAttribute(WJQConstants.MEMBER_ID)==null){
                t.setType(OnlineMessage.USER_TYPE_VISTOR);
            }
            else{
                t.setMemberId(Long.parseLong(request.getSession().getAttribute(WJQConstants.MEMBER_ID).toString()));
                t.setType(OnlineMessage.USER_TYPE_MEMBER);
            }
            onlineMessageManager.save(t);
            modelMap.addAttribute("result", true);
        }
        return "jsonView";
    }
    private void visitorCount(HttpServletRequest request){
        HttpSession session=request.getSession();
        SystemConfig countBean=systemConfigManager.queryVisitorBean();
        if(countBean==null){
            countBean=new SystemConfig();
            countBean.setCount(0);
            systemConfigManager.save(countBean);
        }

        Long count=(Long)session.getAttribute("count");
        if(session.getAttribute("count")==null){
            session.setAttribute("count", countBean.getCount()+1);
            systemConfigManager.updateVisitorCount(countBean);
        }else{
            session.setAttribute("count", count);
        }
    }
}
