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
import com.hux.vvownerclub.dbmodel.TUserCar;
import com.hux.vvownerclub.service.asyntask.EmailTask;
import com.hux.vvownerclub.service.asyntask.MemLogTask;
import com.hux.vvownerclub.service.job.staticpage.IndexNews;
import com.hux.vvownerclub.service.job.staticpage.PicTop5;
import com.hux.vvownerclub.util.SystemCodes;
import com.jfinal.aop.Before;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.upload.UploadFile;
import com.sun.imageio.plugins.common.ImageUtil;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.core.task.TaskExecutor;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: xiang
 * Date: 13-7-22
 * Time: 下午9:02
 */
@Before(AuthInterceptor.class)
public class AdminController extends BaseController {

    @Inject.BY_NAME
    private TaskExecutor taskExecutor;

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

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "进入修改个人资料界面"));

        setAttr("rel", "profile");
        setAttr("user", user);

        render("admin/profile.ftl");
    }

    /**
     * 保存修改后的个人信息
     */
    public void updateProfile() {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "更新个人信息"));

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

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);

        setAttr("rel", "chpwd");

        taskExecutor.execute(new MemLogTask(user.getInt("id"), "进入修改密码界面"));
        render("admin/chpwd.ftl");
    }

    /**
     * 修改密码
     */
    public void updatePassword() {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "更新密码"));

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

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "进入修改个人头像界面"));

        setAttr("rel", "portrait");
        render("admin/portrait.ftl");
    }

    /**
     * 上传个人头像
     */
    public void uploadportrait() throws Exception {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "上传个人头像"));

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

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "剪切个人头像"));

        String oldpic = PathKit.getWebRootPath() + File.separator + "upload" + File.separator + "temp" + File.separator + getPara("fn");
        String newpic = PathKit.getWebRootPath() + File.separator + "upload" + File.separator + "portrait" + File.separator + getPara("fn");
        ImageCut.abscut(oldpic, newpic, getParaToInt("left"), getParaToInt("top"), getParaToInt("width"), getParaToInt("height"));

        user.set("pic", "/upload/portrait/" + getPara("fn"));
        user.update();
        new File(oldpic).delete();
        renderAKFJsonSuccess();
    }

    /**
     * 进入个性化设置
     */
    public void userSettings() {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "进入个性化设置界面"));

        setAttr("rel", "userSettings");
        render("admin/userSettings.ftl");
    }

    /**
     * 保存个性化设置
     */
    @Before(Tx.class)
    public void updateUserSettings() {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "保存个性化设置"));

        String url = getPara("url");
        url = url.replaceAll("/", "");
        List<Record> lists = Db.find("select 1 from t_user where url = ? ", url);
        if (lists.size() > 0) {
            renderJson("errormsg", url + " 已经被使用！请换一个。");
        } else {
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
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "进入新闻发布界面"));

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

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "进入新增新闻界面"));

        setAttr("rel", "releases");
        render("admin/releasesNew.ftl");
    }

    /**
     * 上传新闻中的图片
     */
    public void uploadReleasesImg() {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "上传新闻图片"));

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
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "保存新闻信息"));

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
        news.set("content", getPara("html"));
        if (re.length() > 60) {
            re = re.substring(0, 60);
        }
        news.set("sim_content", re);
        news.set("sim_pic", img);
        news.set("relman", user.get("id"));
        news.set("reltime", new Date());
        news.set("status", SystemCodes.C_0501);
        news.set("is_index", getPara("isindex"));
        news.set("click", 0);
        news.set("reply", 0);
        if (getPara("isindex", SystemCodes.N).equals(SystemCodes.Y)) {
            news.set("indexpic", getPara("indexpic"));
            news.set("indexs", getPara("indexpics"));
        }
        news.save();
        renderAKFJsonSuccess();
    }

    /**
     * 进入修改界面
     */
    public void releasesMod() {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "进入新闻修改界面"));

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

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "更新新闻信息"));

        TNews news = TNews.dao.findById(getParaToInt("id"));

        String text = getPara("text");
        String img = null;
        if (text.indexOf("<") != -1) {
            img = text.substring(text.indexOf("<"), text.indexOf("/>") + 2);
        }
        String re = text.replaceAll("<[^>]*>", "");
        re = re.replaceAll(" ", "");
        re = re.replaceAll("\\s", "");

        news.set("title", getPara("title"));
        news.set("source", getPara("from", null));
        news.set("content", getPara("html"));
        if (re.length() > 60) {
            re = re.substring(0, 60);
        }
        news.set("sim_content", re);
        news.set("sim_pic", img);
        news.set("relman", user.get("id"));
        news.set("reltime", new Date());
        news.set("status", SystemCodes.C_0501);
        news.set("is_index", getPara("isindex"));
        if (getPara("isindex", SystemCodes.N).equals(SystemCodes.Y)) {
            news.set("indexpic", getPara("indexpic"));
            news.set("indexs", getPara("indexpics"));
        }
        news.update();
        renderAKFJsonSuccess();
    }

    /**
     * 删除新闻
     */
    public void delrelease() {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "删除新闻信息"));

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

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "进入审核信息列表界面"));

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

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "进入审核新闻界面"));

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

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "预览新闻"));

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
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "审核通过"));

        TNews news = TNews.dao.findById(getParaToInt("id"));
        news.set("status", SystemCodes.C_0502);
        news.set("reviewman", user.get("id"));
        news.set("reviewtime", new Date());
        news.update();

        taskExecutor.execute(new PicTop5());
        taskExecutor.execute(new IndexNews());
        renderAKFJsonSuccess();
    }

    /**
     * 审核退回
     */
    public void reviewback() {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "审核退回"));

        TNews news = TNews.dao.findById(getParaToInt("id"));
        news.set("status", SystemCodes.C_0504);
        news.set("backman", user.get("id"));
        news.set("backtime", new Date());
        news.update();
        renderAKFJsonSuccess();
    }

    /**
     * 用户管理
     */
    public void member() {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "进入用户管理界面"));

        int p = getParaToInt("p", 1);
        Page<TUser> userPage = TUser.dao.paginate(p, 20, "select * ",
                "from t_user order by regtime desc");
        setAttr("result", userPage);
        render("admin/manage/member.ftl");
    }

    /**
     * 查看用户
     */
    public void memberview() {

        if (StringUtils.isEmpty(getPara("i"))) {

            render404();
            return;
        }
        TUser user = TUser.dao.findById(getParaToInt("i"));
        setAttr("user", user);
        setAttr("carlist", TUserCar.dao.find("select * from t_user_car where user_id = ?", user.get("id")));
        render("admin/manage/memberview.ftl");
    }

    /**
     * 用户激活
     */
    public void memberactive() {
        TUser my = getSessionAttr(ContantsUtil._SESSIONOB);

        TUser user = TUser.dao.findById(getParaToInt("id"));
        user.set("active_time", new Date());
        user.set("active_man", my.get("id"));
        user.update();

        Map propMap = new HashMap();
        propMap.put("name", user.get("name"));
        propMap.put("login_email", user.getStr("login_email"));
        propMap.put("password", TripleDes.decrypt(user.getStr("password"), null));

        taskExecutor.execute(new EmailTask(user.getStr("login_email"), "尊敬的" + user.getStr("name") + "用户：沃沃车友激活啦。", "common/active.ftl", propMap));

        renderAKFJsonSuccess();
    }

    /**
     * 车型信息维护
     */
    public void car() {

        TUser u = getSessionAttr(ContantsUtil._SESSIONOB);

        //查询车型信息
        List<TUserCar> carList = TUserCar.dao.find("select * from t_user_car u " +
                "where u.user_id = ? order by id desc", u.get("id"));
        setAttr("carList", carList);

        setAttr("rel", "car");
        render("admin/car.ftl");
    }

    /**
     * 增加车型
     */
    public void addcar() {

        TUser u = getSessionAttr(ContantsUtil._SESSIONOB);
        TUserCar userCar = new TUserCar();
        userCar.set("user_id", u.get("id"));
        userCar.set("ctype", getPara("ctype"));
        userCar.set("cpz", getPara("cpz"));
        userCar.save();
        renderAKFJsonSuccess();
    }

    /**
     * 增加车型
     */
    public void delcar() {

        TUserCar.dao.deleteById(getParaToInt("id"));
        renderAKFJsonSuccess();
    }
}
