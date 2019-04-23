package com.xiaoshu.api.utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.interfaces.DecodedJWT;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * token 工具类
 * 老默
 * 2019/04/22
 */
public class JwtUtil {
    /**
     * 设置token的过期时间60分钟
     */
    private static final long EXPIRE_TIME=60 * 60 * 1000;
    /**
     * 设置token密钥
     */
    private static final String TOKEN_SECRET="f2sa589adc255aasd253ecd0ddfc52";

    /**
     * 生成签名（Token）15分钟过期
     * @param username 用户的登录账号
     * @param userId 用户的id
     * @return 加密后的token
     */
    public static String sign(String username,Long userId){
        try{
            //计算token失效时间
            Date data=new Date(System.currentTimeMillis()+EXPIRE_TIME);
            //设置密钥及加密算法
            Algorithm algorithm=Algorithm.HMAC256(TOKEN_SECRET);
            //设置头部信息
            Map<String,Object> header=new HashMap<>(2);
            header.put("typ","JWT");
            header.put("alg","HS256");
            //附带username ,userId信息，生成签名
            return JWT.create()
                    .withHeader(header)
                    .withClaim("loginName",username)
                    .withClaim("userId",userId)
                    .withExpiresAt(data)
                    .sign(algorithm);
        }catch (Exception e){
            return null;
        }
    }

    /**
     * 校验token是否正确
     * @param token 密钥
     * @return 是否正确
     */
    public static boolean verifyToken(String token){
        try {
            Algorithm algorithm = Algorithm.HMAC256(TOKEN_SECRET);
            JWTVerifier verifier = JWT.require(algorithm).build();
            DecodedJWT jwt = verifier.verify(token);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    /**
     * 获取登录用户ID
     * @param token 登录密钥
     * @return 用户id
     */
    public static Integer getUserId(String token){
        try {
            DecodedJWT jwt = JWT.decode(token);
            return jwt.getClaim("userId").asInt();
        }catch (JWTDecodeException e){
            return null;
        }
    }
}
