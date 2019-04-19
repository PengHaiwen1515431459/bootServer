package com.xiaoshu.api.controller;

import com.xiaoshu.admin.entity.User;
import com.xiaoshu.admin.service.UserService;
import com.xiaoshu.api.utils.WebConstants;
import com.xiaoshu.common.base.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;


@Api("App用户登录相关接口")
@RequestMapping("api")
@RestController
public class LoginController extends BaseController{

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    UserService userService;

    @ApiOperation(value = "APP用户登录", notes = "APP用户登录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "username", value = "账号", paramType = "query", required = true, dataType = "String"),
            @ApiImplicitParam(name = "password", value = "密码", paramType = "query", required = true, dataType = "String")
    })
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public R login(@RequestParam(value = "username", defaultValue = "") String username,
                   @RequestParam(value = "password", defaultValue = "") String password, HttpSession session) {
        logger.info("app用户登录");
        User user = userService.findUserByLoginName(username);
        if (user !=null){
            putSessionData(session,"user", user);
        }
        return R.ok(WebConstants.WEB_LOGIN_SUCCESS,WebConstants.WEB_LOGIN_SUCCESS_MSG, user);
    }

    @ApiOperation(value = "获取app用户登录信息", notes = "获取APP用户信息")
    @RequestMapping(value = "/server/getUser", method = RequestMethod.POST)
    public R login( HttpSession session) {
        User user =(User) session.getAttribute("user");
        System.out.println(user.getLoginName());
        return R.ok(WebConstants.WEB_CODE_SUCCESS,WebConstants.WEB_CODE_SUCCESS_MSG);
    }






}
