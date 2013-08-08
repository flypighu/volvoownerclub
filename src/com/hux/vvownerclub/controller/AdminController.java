package com.hux.vvownerclub.controller;

import com.hux.frame.core.controller.BaseController;
import com.hux.frame.core.interceptor.AuthInterceptor;
import com.hux.frame.core.model.DataTablesModel;
import com.hux.frame.util.ContantsUtil;
import com.hux.frame.util.ImageCut;
import com.hux.frame.util.WebUtils;
import com.hux.frame.util.encrypt.TripleDes;
import com.hux.vvownerclub.dbmodel.TNews;
import com.hux.vvownerclub.dbmodel.TUser;
import com.hux.vvownerclub.util.SystemCodes;
import com.jfinal.aop.Before;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.upload.UploadFile;
import com.sun.imageio.plugins.common.ImageUtil;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xiang
 * Date: 13-7-22
 * Time: 下午9:02
 */
@Before(AuthInterceptor.class)
public class AdminController extends BaseController {

    /**
     * 个人空间管理主页
     */
    public void index() {

        this.profile();
    }

    /**
     * 修改个人资料
     */
    public void profile() {

        setAttr("rel", "profile");
        setAttr("user", getSessionAttr(ContantsUtil._SESSIONOB));
        render("admin/profile.ftl");
    }

    /**
     * 保存修改后的个人信息
     */
    public void updateProfile() {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        user.set("name", getPara("name"));
        user.set("gender", getPara("gender"));
        user.set("province", getPara("province"));
        user.set("city", getPara("city"));
        user.set("tel", getPara("tel"));
        user.set("qq", getPara("qq"));
        user.update();
        renderAKFJsonSuccess();
    }

    /**
     * 修改登录密码
     */
    public void chpwd() {

        setAttr("rel", "chpwd");
        render("admin/chpwd.ftl");
    }

    /**
     * 修改密码
     */
    public void updatePassword() {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);

        //如果密码不一样
        if (!TripleDes.decrypt(user.getStr("password"), null).equals(getPara("oldpassword"))) {

            renderAKFJsonError("密码验证错误，请重新输入！");
        } else {
            user.set("password", TripleDes.encrypt(getPara("newpassword"), null));
            user.update();
            renderAKFJsonSuccess();
        }
    }

    /**
     * 修改个人头像
     */
    public void portrait() {

        setAttr("rel", "portrait");
        render("admin/portrait.ftl");
    }

    /**
     * 上传个人头像
     */
    public void uploadportrait() throws Exception {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);

        UploadFile uploadFile = getFile("fileToUpload");
        String picType = uploadFile.getContentType().substring(uploadFile.getContentType().indexOf("/") + 1, uploadFile.getContentType().length());

        boolean error = true;
        for (int i = 0; i < ContantsUtil._UPLOADIMG.length; i++) {

            if (picType.equals(ContantsUtil._UPLOADIMG[i])) {
                error = false;
                break;
            }
        }
        if (error) {
            uploadFile.getFile().delete();
            renderText("{error:'请上传图片文件！',msg:'");
        } else {
            String newfilename = user.getInt("id") + System.currentTimeMillis() + "." + picType;
            String newfilepath = PathKit.getWebRootPath() + File.separator + "upload" + File.separator + "temp" + File.separator + newfilename;
            uploadFile.getFile().renameTo(new File(newfilepath));
            BufferedImage image = ImageIO.read(new FileInputStream(newfilepath));

            JSONObject ob = new JSONObject();
            ob.put("error", "");
            ob.put("msg", "/upload/temp/" + newfilename);
            ob.put("fn", newfilename);
            ob.put("w", image.getWidth());
            ob.put("h", image.getHeight());
            renderJson(ob);
        }

    }

    /**
     * 剪切头像
     */
    @Before(Tx.class)
    public void cutportrait() {

        String oldpic = PathKit.getWebRootPath() + File.separator + "upload" + File.separator + "temp" + File.separator + getPara("fn");
        String newpic = PathKit.getWebRootPath() + File.separator + "upload" + File.separator + "portrait" + File.separator + getPara("fn");
        ImageCut.abscut(oldpic, newpic, getParaToInt("left"), getParaToInt("top"), getParaToInt("width"), getParaToInt("height"));
        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        user.set("pic", "/upload/portrait/" + getPara("fn"));
        user.update();
        new File(oldpic).delete();
        renderAKFJsonSuccess();
    }

    /**
     * 进入个性化设置
     */
    public void userSettings() {

        setAttr("rel", "userSettings");
        render("admin/userSettings.ftl");
    }

    /**
     * 保存个性化设置
     */
    @Before(Tx.class)
    public void updateUserSettings() {

        String url = getPara("url");
        url = url.replaceAll("/", "");
        List<Record> lists = Db.find("select 1 from t_user where url = ? ", url);
        if (lists.size() > 0) {
            renderJson("errormsg", url + " 已经被使用！请换一个。");
        } else {
            TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
            user.set("url", url);
            user.set("title", getPara("title"));
            user.update();
            renderJson("url", url);
        }
    }

    /**
     * 进入新闻发布界面
     */
    public void releases() {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);

        String shzt = getPara(0, SystemCodes.C_0501);

        Page<TNews> page = null;
        if (SystemCodes.C_0501.equals(shzt)) {
            page = TNews.dao.paginate(1, 100, "select n.id, n.title, n.status, n.reltime, u.name ",
                    " from t_news n left join t_user u on u.id = n.relman where n.status = ? and n.relman = ? order by n.reltime desc ", shzt, user.getInt("id"));

        }
        if (SystemCodes.C_0502.equals(shzt)) {
            page = TNews.dao.paginate(1, 100, "select n.id, n.title, n.status, n.reltime, u.name, n.reviewtime, u1.name as reviewman ",
                    " from t_news n left join t_user u on u.id = n.relman " +
                            " left join t_user u1 on u1.id = n.reviewman where n.status = ? and n.relman = ? order by n.reviewtime desc ", shzt, user.getInt("id"));
        }
        if (SystemCodes.C_0504.equals(shzt)) {
            page = TNews.dao.paginate(1, 100, "select n.id, n.title, n.status, n.reltime, u.name, n.backtime, u1.name as backman ",
                    " from t_news n left join t_user u on u.id = n.relman " +
                            " left join t_user u1 on u1.id = n.backman where n.status = ? and n.relman = ?  order by n.backtime desc ", shzt, user.getInt("id"));
        }

        setAttr("result", page);
        setAttr("rel", "releases");
        setAttr("shzt", shzt);
        render("admin/releases.ftl");
    }

    /**
     * 进入新增新闻界面
     */
    public void releasesNew() {

        setAttr("rel", "releases");
        render("admin/releasesNew.ftl");
    }

    /**
     * 上传新闻中的图片
     */
    public void uploadReleasesImg() {

        UploadFile uploadFile = getFile("imgFile");
        String type = getPara("dir");

        String newfilename = System.currentTimeMillis() + "_" + uploadFile.getFileName();
        StringBuilder newfilepath = new StringBuilder();
        StringBuilder url = new StringBuilder();
        newfilepath.append(PathKit.getWebRootPath()).append(File.separator).append("upload").append(File.separator).append("releases").append(File.separator);
        url.append("/upload/releases/");

        DateFormat format = new java.text.SimpleDateFormat("yyyy/MMdd");
        String[] d = format.format(new Date()).split("/");
        File dir = new File(newfilepath.append(d[0]).toString());
        url.append(d[0]);
        if (!dir.exists()) {
            dir.mkdir();
        }
        newfilepath.append(File.separator);
        url.append("/");

        dir = new File(newfilepath.append(d[1]).toString());
        url.append(d[1]);
        if (!dir.exists()) {
            dir.mkdir();

        }
        newfilepath.append(File.separator);
        url.append("/");

        newfilepath.append(newfilename);
        url.append(newfilename);
        uploadFile.getFile().renameTo(new File(newfilepath.toString()));

        JSONObject ob = new JSONObject();
        ob.put("error", 0);
        ob.put("url", url.toString());
        renderJson(ob);
    }

    /**
     * 保存新闻
     */
    public void saveReleases() {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);

        String text = getPara("text");
        String img = null;
        if (text.indexOf("<") != -1) {
            img = text.substring(text.indexOf("<"), text.indexOf("/>") + 2);
        }
        String re = text.replaceAll("<[^>]*>", "");
        re = re.replaceAll(" ", "");
        re = re.replaceAll("\\s", "");

        TNews news = new TNews();
        news.set("title", getPara("title"));
        news.set("source", getPara("from", null));
        news.set("is_index", SystemCodes.N);
        news.set("content", getPara("html"));
        if (re.length() > 60) {
            re = re.substring(0, 60);
        }
        news.set("sim_content", re);
        news.set("sim_pic", img);
        news.set("relman", user.get("id"));
        news.set("reltime", new Date());
        news.set("status", SystemCodes.C_0501);
        news.save();
        renderAKFJsonSuccess();
    }

    /**
     * 进入修改界面
     */
    public void releasesMod() {

        if (StringUtils.isBlank(getPara())) {
            this.releases();
        }
        setAttr("news", TNews.dao.findById(getParaToInt()));
        setAttr("rel", "releases");
        render("admin/releasesMod.ftl");
    }

    /**
     * 更新新闻
     */
    public void updateReleases() {

        TNews n = TNews.dao.findById(getParaToInt("id"));
        n.set("title", getPara("title"));
        n.set("source", getPara("from", null));
        n.set("content", getPara("html"));
        n.update();
        renderAKFJsonSuccess();
    }

    /**
     * 删除新闻
     */
    public void delrelease() {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);

        TNews n = TNews.dao.findById(getParaToInt("id"));
        n.set("delman", user.get("id"));
        n.set("deltime", new Date());
        n.set("status", SystemCodes.C_0503);
        n.update();
        renderAKFJsonSuccess();
    }

    /**
     * 进入审核列表界面
     */
    public void review() {

        String shzt = getPara(0, SystemCodes.C_0501);

        Page<TNews> page = null;
        if (SystemCodes.C_0501.equals(shzt)) {
            page = TNews.dao.paginate(1, 100, "select n.id, n.title, n.status, n.reltime, u.name ",
                    " from t_news n left join t_user u on u.id = n.relman where n.status = ? order by n.reltime desc ", shzt);

        }
        if (SystemCodes.C_0502.equals(shzt)) {
            page = TNews.dao.paginate(1, 100, "select n.id, n.title, n.status, n.reltime, u.name, n.reviewtime, u1.name as reviewman ",
                    " from t_news n left join t_user u on u.id = n.relman " +
                            " left join t_user u1 on u1.id = n.reviewman where n.status = ? order by n.reviewtime desc ", shzt);
        }
        if (SystemCodes.C_0504.equals(shzt)) {
            page = TNews.dao.paginate(1, 100, "select n.id, n.title, n.status, n.reltime, u.name, n.backtime, u1.name as backman ",
                    " from t_news n left join t_user u on u.id = n.relman " +
                            " left join t_user u1 on u1.id = n.backman where n.status = ? order by n.backtime desc ", shzt);
        }
        setAttr("result", page);
        setAttr("rel", "review");
        setAttr("shzt", shzt);
        render("admin/manage/review.ftl");
    }

    /**
     * 进入审核新闻界面
     */
    public void reviewnews() {
        if (StringUtils.isEmpty(getPara())) {
            this.review();
        }

        setAttr("news", TNews.dao.findFirst("select n.*,u.name as relmanname from t_news n left join t_user u on u.id = n.relman where n.id = ?", getParaToInt()));
        render("admin/manage/reviewnews.ftl");
    }


    /**
     * 预览某篇文章
     */
    public void previewnews() {
        if (StringUtils.isEmpty(getPara())) {
            this.review();
        }

        setAttr("news", TNews.dao.findFirst("select n.*,u.name as relmanname from t_news n left join t_user u on u.id = n.relman where n.id = ?", getParaToInt()));
        render("admin/manage/previewnews.ftl");
    }

    /**
     * 审核通过
     */
    public void reviewpass() {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);

        TNews news = TNews.dao.findById(getParaToInt("id"));
        news.set("status", SystemCodes.C_0502);
        news.set("reviewman", user.get("id"));
        news.set("reviewtime", new Date());
        news.update();
        renderAKFJsonSuccess();
    }

    /**
     * 审核退回
     */
    public void reviewback() {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);

        TNews news = TNews.dao.findById(getParaToInt("id"));
        news.set("status", SystemCodes.C_0504);
        news.set("backman", user.get("id"));
        news.set("backtime", new Date());
        news.update();
        renderAKFJsonSuccess();
    }
}
