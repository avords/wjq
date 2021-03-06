/*
 * Copyright 2004 original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.extremecomponents.table.view.html;

import java.util.Locale;

import org.extremecomponents.table.bean.Export;
import org.extremecomponents.table.core.TableConstants;
import org.extremecomponents.table.core.TableModel;
import org.extremecomponents.table.view.html.toolbar.ButtonItem;
import org.extremecomponents.table.view.html.toolbar.ImageItem;
import org.extremecomponents.table.view.html.toolbar.TextItem;
import org.extremecomponents.table.view.html.toolbar.ToolbarItemUtils;
import org.extremecomponents.util.HtmlBuilder;

import com.mvc.framework.util.MessageUtils;

/**
 * @author Jeff Johnston
 */
public class ToolbarBuilder {
    private HtmlBuilder html;
    private TableModel model;
    private Locale locale;

    public ToolbarBuilder(TableModel model) {
        this(new HtmlBuilder(), model);
    }
    
    public ToolbarBuilder(HtmlBuilder html, TableModel model) {
        this.html = html;
        this.model = model;
        this.locale = model.getLocale();
        
    }
    
    public HtmlBuilder getHtmlBuilder() {
        return html;
    }

    protected TableModel getTableModel() {
        return model;
    }

    public void firstPageItemAsButton() {
        ButtonItem item = new ButtonItem();
        item.setTooltip(MessageUtils.getMessage(BuilderConstants.TOOLBAR_FIRST_PAGE_TOOLTIP,locale));
        item.setContents(MessageUtils.getMessage(BuilderConstants.TOOLBAR_FIRST_PAGE_TEXT,locale));
        ToolbarItemUtils.buildFirstPage(html, model, item);
    }

    public void firstPageItemAsImage() {
        ImageItem item = new ImageItem();
        item.setTooltip(MessageUtils.getMessage(BuilderConstants.TOOLBAR_FIRST_PAGE_TOOLTIP,locale));
        item.setDisabledImage(BuilderUtils.getImage(model, BuilderConstants.TOOLBAR_FIRST_PAGE_DISABLED_IMAGE));
        item.setImage(BuilderUtils.getImage(model, BuilderConstants.TOOLBAR_FIRST_PAGE_IMAGE));
        item.setAlt(MessageUtils.getMessage(BuilderConstants.TOOLBAR_FIRST_PAGE_TEXT,locale));
        item.setStyle("border:0");
        ToolbarItemUtils.buildFirstPage(html, model, item);
    }

    public void firstPageItemAsText() {
        TextItem item = new TextItem();
        item.setTooltip(MessageUtils.getMessage(BuilderConstants.TOOLBAR_FIRST_PAGE_TOOLTIP,locale));
        item.setText(MessageUtils.getMessage(BuilderConstants.TOOLBAR_FIRST_PAGE_TEXT,locale));
        ToolbarItemUtils.buildFirstPage(html, model, item);
    }

    public void prevPageItemAsButton() {
        ButtonItem item = new ButtonItem();
        item.setTooltip(MessageUtils.getMessage(BuilderConstants.TOOLBAR_PREV_PAGE_TOOLTIP,locale));
        item.setContents(MessageUtils.getMessage(BuilderConstants.TOOLBAR_PREV_PAGE_TEXT,locale));
        ToolbarItemUtils.buildPrevPage(html, model, item);
    }

    public void prevPageItemAsImage() {
        ImageItem item = new ImageItem();
        item.setTooltip(MessageUtils.getMessage(BuilderConstants.TOOLBAR_PREV_PAGE_TOOLTIP,locale));
        item.setDisabledImage(BuilderUtils.getImage(model, BuilderConstants.TOOLBAR_PREV_PAGE_DISABLED_IMAGE));
        item.setImage(BuilderUtils.getImage(model, BuilderConstants.TOOLBAR_PREV_PAGE_IMAGE));
        item.setAlt(MessageUtils.getMessage(BuilderConstants.TOOLBAR_PREV_PAGE_TEXT,locale));
        item.setStyle("border:0");
        ToolbarItemUtils.buildPrevPage(html, model, item);
    }

    public void prevPageItemAsText() {
        TextItem item = new TextItem();
        item.setTooltip(MessageUtils.getMessage(BuilderConstants.TOOLBAR_PREV_PAGE_TOOLTIP,locale));
        item.setText(MessageUtils.getMessage(BuilderConstants.TOOLBAR_PREV_PAGE_TEXT,locale));
        ToolbarItemUtils.buildPrevPage(html, model, item);
    }

    public void nextPageItemAsButton() {
        ButtonItem item = new ButtonItem();
        item.setTooltip(MessageUtils.getMessage(BuilderConstants.TOOLBAR_NEXT_PAGE_TOOLTIP,locale));
        item.setContents(MessageUtils.getMessage(BuilderConstants.TOOLBAR_NEXT_PAGE_TEXT,locale));
        ToolbarItemUtils.buildNextPage(html, model, item);
    }

    public void nextPageItemAsImage() {
        ImageItem item = new ImageItem();
        item.setTooltip(MessageUtils.getMessage(BuilderConstants.TOOLBAR_NEXT_PAGE_TOOLTIP,locale));
        item.setDisabledImage(BuilderUtils.getImage(model, BuilderConstants.TOOLBAR_NEXT_PAGE_DISABLED_IMAGE));
        item.setImage(BuilderUtils.getImage(model, BuilderConstants.TOOLBAR_NEXT_PAGE_IMAGE));
        item.setAlt(MessageUtils.getMessage(BuilderConstants.TOOLBAR_NEXT_PAGE_TEXT,locale));
        item.setStyle("border:0");
        ToolbarItemUtils.buildNextPage(html, model, item);
    }

    public void nextPageItemAsText() {
        TextItem item = new TextItem();
        item.setTooltip(MessageUtils.getMessage(BuilderConstants.TOOLBAR_NEXT_PAGE_TOOLTIP,locale));
        item.setText(MessageUtils.getMessage(BuilderConstants.TOOLBAR_NEXT_PAGE_TEXT,locale));
        ToolbarItemUtils.buildNextPage(html, model, item);
    }

    public void lastPageItemAsButton() {
        ButtonItem item = new ButtonItem();
        item.setTooltip(MessageUtils.getMessage(BuilderConstants.TOOLBAR_LAST_PAGE_TOOLTIP,locale));
        item.setContents(MessageUtils.getMessage(BuilderConstants.TOOLBAR_LAST_PAGE_TEXT,locale));
        ToolbarItemUtils.buildLastPage(html, model, item);
    }

    public void lastPageItemAsImage() {
        ImageItem item = new ImageItem();
        item.setTooltip(MessageUtils.getMessage(BuilderConstants.TOOLBAR_LAST_PAGE_TOOLTIP,locale));
        item.setDisabledImage(BuilderUtils.getImage(model, BuilderConstants.TOOLBAR_LAST_PAGE_DISABLED_IMAGE));
        item.setImage(BuilderUtils.getImage(model, BuilderConstants.TOOLBAR_LAST_PAGE_IMAGE));
        item.setAlt(MessageUtils.getMessage(BuilderConstants.TOOLBAR_LAST_PAGE_TEXT,locale));
        item.setStyle("border:0");
        ToolbarItemUtils.buildLastPage(html, model, item);
    }

    public void lastPageItemAsText() {
        TextItem item = new TextItem();
        item.setTooltip(MessageUtils.getMessage(BuilderConstants.TOOLBAR_LAST_PAGE_TOOLTIP,locale));
        item.setText(MessageUtils.getMessage(BuilderConstants.TOOLBAR_LAST_PAGE_TEXT,locale));
        ToolbarItemUtils.buildLastPage(html, model, item);
    }

    public void filterItemAsButton() {
        ButtonItem item = new ButtonItem();
        item.setTooltip(MessageUtils.getMessage(BuilderConstants.TOOLBAR_FILTER_TOOLTIP,locale));
        item.setContents(MessageUtils.getMessage(BuilderConstants.TOOLBAR_FILTER_TEXT,locale));
        ToolbarItemUtils.buildFilter(html, model, item);
    }

    public void filterItemAsImage() {
        ImageItem item = new ImageItem();
        item.setTooltip(MessageUtils.getMessage(BuilderConstants.TOOLBAR_FILTER_TOOLTIP,locale));
        item.setImage(BuilderUtils.getImage(model, BuilderConstants.TOOLBAR_FILTER_IMAGE));
        item.setAlt(MessageUtils.getMessage(BuilderConstants.TOOLBAR_FILTER_TEXT,locale));
        item.setStyle("border:0");
        ToolbarItemUtils.buildFilter(html, model, item);
    }

    public void filterItemAsText() {
        TextItem item = new TextItem();
        item.setTooltip(MessageUtils.getMessage(BuilderConstants.TOOLBAR_FILTER_TOOLTIP,locale));
        item.setText(MessageUtils.getMessage(BuilderConstants.TOOLBAR_FILTER_TEXT,locale));
        ToolbarItemUtils.buildFilter(html, model, item);
    }

    public void clearItemAsButton() {
        ButtonItem item = new ButtonItem();
        item.setTooltip(MessageUtils.getMessage(BuilderConstants.TOOLBAR_CLEAR_TOOLTIP,locale));
        item.setContents(MessageUtils.getMessage(BuilderConstants.TOOLBAR_CLEAR_TEXT,locale));
        ToolbarItemUtils.buildClear(html, model, item);
    }

    public void clearItemAsImage() {
        ImageItem item = new ImageItem();
        item.setTooltip(MessageUtils.getMessage(BuilderConstants.TOOLBAR_CLEAR_TOOLTIP,locale));
        item.setImage(BuilderUtils.getImage(model, BuilderConstants.TOOLBAR_CLEAR_IMAGE));
        item.setAlt(MessageUtils.getMessage(BuilderConstants.TOOLBAR_CLEAR_TEXT,locale));
        item.setStyle("border:0");
        ToolbarItemUtils.buildClear(html, model, item);
    }

    public void clearItemAsText() {
        TextItem item = new TextItem();
        item.setTooltip(MessageUtils.getMessage(BuilderConstants.TOOLBAR_CLEAR_TOOLTIP,locale));
        item.setText(MessageUtils.getMessage(BuilderConstants.TOOLBAR_CLEAR_TEXT,locale));
        ToolbarItemUtils.buildClear(html, model, item);
    }

    public void exportItemAsButton(Export export) {
        ButtonItem item = new ButtonItem();
        item.setTooltip(export.getTooltip());
        item.setContents(export.getText());
        ToolbarItemUtils.buildExport(html, model, item, export);
    }

    public void exportItemAsImage(Export export) {
        ImageItem item = new ImageItem();
        item.setTooltip(export.getTooltip());
        item.setImage(BuilderUtils.getImage(model, export.getImageName()));
        item.setAlt(export.getText());
        item.setStyle("border:0");
        ToolbarItemUtils.buildExport(html, model, item, export);
    }

    public void exportItemAsText(Export export) {
        TextItem item = new TextItem();
        item.setTooltip(export.getTooltip());
        item.setText(export.getText());
        ToolbarItemUtils.buildExport(html, model, item, export);
    }

    public void rowsDisplayedDroplist() {
        int rowsDisplayed = model.getTableHandler().getTable().getRowsDisplayed();
        int medianRowsDisplayed = model.getTableHandler().getTable().getMedianRowsDisplayed();
        int maxRowsDisplayed = model.getTableHandler().getTable().getMaxRowsDisplayed();
        //pubx add begin
    	Object sessionValue = model.getContext().getSessionAttribute(TableConstants.EXTREME_COMPONENTS + "_" + TableConstants.CURRENT_ROWS_DISPLAYED);
    	int currentRowsDisplayed;
    	if(sessionValue!=null){
    		currentRowsDisplayed = (Integer)sessionValue;
    	}
    	//pubx add end
    	else{
    		currentRowsDisplayed = model.getLimit().getCurrentRowsDisplayed();
    	}
        

        html.select().name(model.getTableHandler().prefixWithTableId() + TableConstants.ROWS_DISPLAYED);

        StringBuffer onchange = new StringBuffer();
        onchange.append(new TableActions(model).getRowsDisplayedAction());
        html.onchange(onchange.toString());

        html.close();

        html.newline();
        html.tabs(4);

        // default rows
        html.option().value(String.valueOf(rowsDisplayed));
        if (currentRowsDisplayed == rowsDisplayed) {
            html.selected();
        }
        html.close();
        html.append(String.valueOf(rowsDisplayed));
        html.optionEnd();

        // median rows
        html.option().value(String.valueOf(medianRowsDisplayed));
        if (currentRowsDisplayed == medianRowsDisplayed) {
            html.selected();
        }
        html.close();
        html.append(String.valueOf(medianRowsDisplayed));
        html.optionEnd();

        // max rows
        html.option().value(String.valueOf(maxRowsDisplayed));
        if (currentRowsDisplayed == maxRowsDisplayed) {
            html.selected();
        }
        html.close();
        html.append(String.valueOf(maxRowsDisplayed));
        html.optionEnd();
        
        //pubx add begin
//        html.option().value(PageUtils.PAGE_SIZE_ALL + "");
//        if (currentRowsDisplayed != rowsDisplayed&&currentRowsDisplayed!=medianRowsDisplayed&&currentRowsDisplayed!=maxRowsDisplayed) {
//            html.selected();
//        }
//        html.close();
//        html.append("ALL");
//        html.optionEnd();
        //pubx add end
        html.newline();
        html.tabs(4);
        html.selectEnd();
    }

    public void separator() {
        html.img();
        html.src(BuilderUtils.getImage(model, BuilderConstants.TOOLBAR_SEPARATOR_IMAGE));
        html.style("border:0");
        html.alt("Separator");
        html.xclose();
    }
    
    public String toString() {
        return html.toString();
    }
}
