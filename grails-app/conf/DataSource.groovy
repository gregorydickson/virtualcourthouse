dataSource {
}
    
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
//    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
		    pooled = true
		    dbCreate = "update"
		    url = "jdbc:mysql://localhost/p1"
		    driverClassName = "com.mysql.jdbc.Driver"
		    dialect = org.hibernate.dialect.MySQL5InnoDBDialect
		    username = "land"
		    password = "0gzr4YjMKrsb2Ix"
			    properties {
		        maxActive = 50
		        maxIdle = 25
		        minIdle = 5
		        initialSize = 5
		        minEvictableIdleTimeMillis = 60000
		        timeBetweenEvictionRunsMillis = 60000
		        maxWait = 10000
		        validationQuery = "/* ping */"
        	}
		}
    }

    production {
        dataSource {
			dbCreate = "update"
	        driverClassName = "org.postgresql.Driver"
	        dialect = org.hibernate.dialect.PostgreSQLDialect
	        uri = new URI(System.env.DATABASE_URL?:"postgres://test:test@localhost/test")
	        url = "jdbc:postgresql://"+uri.host+uri.path
	        username = uri.userInfo.split(":")[0]
	        password = uri.userInfo.split(":")[1]
			  
		}
	}
}