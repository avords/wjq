package com.mvc.cms.web;

import java.io.File;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.fckeditor.response.UploadResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.cms.model.ContentPicture;
import com.mvc.component.file.BaseFileManager;
import com.mvc.component.file.ExtendFileManager;
import com.mvc.framework.util.FileUpDownUtils;
import com.mvc.framework.util.UploadFile;
import com.mvc.framework.web.FrameworkFactory;

@Controller
@RequestMapping("/" + ContentPicture.UPLOAD_ROOT)
public class FckController {

	@RequestMapping("")
	public String upload(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UploadFile uploadFile = FileUpDownUtils.getUploadFile(request, "NewFile");
		ExtendFileManager fileManager = FrameworkFactory.getExtendFileManager();
		BaseFileManager baseFileManager = FrameworkFactory.getBaseFileManager();
		byte[] contents = FileUpDownUtils.getFileContent(uploadFile.getFile());
		String fileExtention = uploadFile.getFileName().substring(uploadFile.getFileName().lastIndexOf("."));
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		String path = ContentPicture.UPLOAD_ROOT + File.separator + dateFormat.format(new Date()) + File.separator
		            + baseFileManager.getNewFileId() + fileExtention;
		fileManager.saveMedia(path,contents, "wjq");
		path = path.replaceAll("\\\\", "/");
		UploadResponse uploadResponse = new UploadResponse(0,"http://127.0.0.1:8000/wjq/upload" + "/" + path);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		out.print(uploadResponse.toString());
		out.flush();
		out.close();
		return null;
	}

	@RequestMapping("{path}/{fileName}")
	public String download(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = request.getRequestURI();
		path = path.replace(request.getContextPath(), "");
		ExtendFileManager fileManager = FrameworkFactory.getExtendFileManager();
		fileManager.writeMedia(path, response.getOutputStream(),"tq");
		return null;
	}
}
