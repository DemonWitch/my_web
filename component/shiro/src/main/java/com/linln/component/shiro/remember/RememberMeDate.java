package com.linln.component.shiro.remember;

import org.hibernate.HibernateException;
import org.hibernate.LazyInitializationException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.proxy.HibernateProxy;
import org.hibernate.proxy.LazyInitializer;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author: YaChao Lv
 * @Date: 2020/12/18 16:20
 * @Description:
 */
public class RememberMeDate extends Date implements HibernateProxy {

    @Override
    public Object writeReplace() {
        return null;
    }

    @Override
    public LazyInitializer getHibernateLazyInitializer() {

        return new LazyInitializer() {
            @Override
            public void initialize() throws HibernateException {
                throw new LazyInitializationException(RememberMeDate.class.getName());
            }

            @Override
            public Serializable getIdentifier() {
                return null;
            }

            @Override
            public void setIdentifier(Serializable id) {

            }

            @Override
            public String getEntityName() {
                return null;
            }

            @Override
            public Class getPersistentClass() {
                return null;
            }

            @Override
            public boolean isUninitialized() {
                return true;
            }

            @Override
            public Object getImplementation() {
                return null;
            }

            @Override
            public Object getImplementation(SharedSessionContractImplementor session) throws HibernateException {
                return null;
            }

            @Override
            public void setImplementation(Object target) {

            }

            @Override
            public boolean isReadOnlySettingAvailable() {
                return false;
            }

            @Override
            public boolean isReadOnly() {
                return false;
            }

            @Override
            public void setReadOnly(boolean readOnly) {

            }

            @Override
            public SharedSessionContractImplementor getSession() {
                return null;
            }

            @Override
            public void setSession(SharedSessionContractImplementor session) throws HibernateException {

            }

            @Override
            public void unsetSession() {

            }

            @Override
            public void setUnwrap(boolean unwrap) {

            }

            @Override
            public boolean isUnwrap() {
                return false;
            }
        };

    }
}
