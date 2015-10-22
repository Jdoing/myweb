package com.myweb.shiro;

import java.io.Serializable;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.CachingSessionDAO;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

public class RedisCacheSessionDao extends CachingSessionDAO {
    @Inject
    private RedisTemplate<Serializable, Session> redisTemplate;

    @Resource(name = "redisTemplate")
    private ValueOperations<Serializable, Session> valueOps;

    private int timeToLive = 15;

    @Override
    protected void doUpdate(Session session) {
        valueOps.set(session.getId(), session, timeToLive, TimeUnit.MINUTES);
    }

    @Override
    protected void doDelete(Session session) {
        if (session == null || session.getId() == null) {
            return;
        }
        redisTemplate.delete(session.getId());
    }

    @Override
    protected Serializable doCreate(Session session) {
        Serializable sessionId = generateSessionId(session);
        assignSessionId(session, sessionId);
        valueOps.set(sessionId, session, timeToLive, TimeUnit.MINUTES);
        return sessionId;
    }

    @Override
    protected Session doReadSession(Serializable sessionId) {
        return valueOps.get(sessionId);
    }

    public int getTimeToLive() {
        return timeToLive;
    }

    public void setTimeToLive(int timeToLive) {
        this.timeToLive = timeToLive;
    }

}
