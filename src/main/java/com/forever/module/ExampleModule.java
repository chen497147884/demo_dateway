package com.forever.module;

import net.hasor.core.ApiBinder;
import net.hasor.core.DimModule;
import net.hasor.db.JdbcModule;
import net.hasor.db.Level;
import net.hasor.spring.SpringModule;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.sql.DataSource;


@DimModule
@Component
public class ExampleModule implements SpringModule {
    @Resource
    private DataSource dataSource;

    @Override
    public void loadModule(ApiBinder apiBinder) throws Throwable {
        // .DataSource form Spring boot into Hasor
        apiBinder.installModule(new JdbcModule(Level.Full, this.dataSource));
        /*apiBinder.bindSpiListener(PreExecuteChainSpi.class, (apiInfo, future) -> {
            apiInfo.getParameterMap().put("self", "me");
        });*/
    }
}
