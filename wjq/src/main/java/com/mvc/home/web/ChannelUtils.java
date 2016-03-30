package com.mvc.home.web;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.swing.tree.DefaultMutableTreeNode;

import com.mvc.cms.model.Channel;
import com.mvc.framework.util.DomainUtils;

public final class ChannelUtils {
    /**
     * 此方法会1级菜单的ID号，遍历其所有的2，3级子节点
     * @param treeNode 1级菜单ID封装的对象
     * @param treeHtml
     * @param locale
     */
    @SuppressWarnings("rawtypes")
    public static void generateTreeHtml(List<DefaultMutableTreeNode> treeNodes, StringBuilder treeHtml) {
        if ( null != treeNodes && treeNodes.size()>0 ) {
            for(DefaultMutableTreeNode treeNode : treeNodes){
                if(treeNode.getUserObject()!=null){
                    Channel menu = (Channel) treeNode.getUserObject();
                    treeHtml.append("<li class='nLi' id='nav" + menu.getObjectId() +"'><h3><a href='javascript:void(0);'>");
                    treeHtml.append(menu.getName()).append("</a></h3>");
                    if (treeNode.getChildCount() > 0) {
                        treeHtml.append("<ul class='sub'>");
                        Enumeration dd = treeNode.children();
                        while (dd.hasMoreElements()) {
                            generateTreeHtml0((DefaultMutableTreeNode) dd.nextElement(), treeHtml);
                        }
                        treeHtml.append("</ul>");
                    }
                    treeHtml.append("</li>");
                }
            }
        }
    }

    public static void generateTreeHtml0(DefaultMutableTreeNode treeNode, StringBuilder treeHtml) {
        if (null != treeNode && null != treeNode.getUserObject()) {
            Channel menu = (Channel) treeNode.getUserObject();
            String target="target='_blank'";
            if(menu.getIsBlank()==2){
                target="target='_self'";
            }
            treeHtml.append("<li><a href='" + DomainUtils.getDynamicDomain() + "/home/index/" + menu.getObjectId() + "' "+target+">");
            treeHtml.append(menu.getName()).append("</a></li>");
        }
    }

    public static Channel getChannelByPositionCode(List<Channel> allPermissionMenus,String positionCode){
        Channel channel = null;
        for(Channel c:allPermissionMenus){
            if(c.getPositionCode().equals(positionCode)&&c.getIsDisplay()==1){
                channel = c;
                break;
            }
        }
        if(channel!=null){
            for(Channel c:allPermissionMenus){
                if(channel.getObjectId().equals(c.getParentId())){
                    channel.getSubChannels().add(c);
                }
            }
        }
        return channel;
    }

    public static List<Channel> getFirstLevelChannel(List<Channel> allPermissionMenus){
        List<Channel> menus = new ArrayList<Channel>();
        if(null!= allPermissionMenus){
            for (Channel menu : allPermissionMenus) {
                if(menu.getParentId()==null){
                    menus.add(menu);
                }
            }
        }
        return menus;
    }

    private static DefaultMutableTreeNode getMenuTree(Channel parentMenu, List<Channel> allPermissionMenus) {
        if (parentMenu != null) {
            DefaultMutableTreeNode treeNode = new DefaultMutableTreeNode(parentMenu);
            List<Channel> menus = new ArrayList<Channel>();
            for (Channel menu : allPermissionMenus) {
                if (menu.getParentId()!=null && menu.getParentId().equals(parentMenu.getObjectId())) {
                    menus.add(menu);
                }
            }
            if (menus.size() > 0) {
                for (Channel menu : menus) {
                    treeNode.add(getMenuTree(menu, allPermissionMenus));
                }
            }
            return treeNode;
        }
        return null;
    }

    public static void getParent(List<Channel> parentChannels,Channel channel, List<Channel> allChannels) {
        if (channel.getParentId()==null) {
            return;
        } else {
            for (Channel temp : allChannels) {
                if (temp.getObjectId().equals(channel.getParentId())) {
                    getParent(parentChannels,temp, allChannels);
                    parentChannels.add(temp);
                }
            }
        }

    }

    public static List<DefaultMutableTreeNode> getTree(List<Channel> allPermissionMenus) {
        List<DefaultMutableTreeNode> tops = new ArrayList<DefaultMutableTreeNode>();
        if(null!=allPermissionMenus){
            for (Channel menu : allPermissionMenus) {
                if(menu.getParentId()==null){
                    tops.add(getMenuTree(menu, allPermissionMenus));
                }
            }
        }
        return tops;
    }

    private ChannelUtils() {
    }
}


