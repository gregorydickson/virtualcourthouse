dataSource {
}
    
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
    cache.provider_class='org.hibernate.cache.EhCacheProvider'
	//    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
		    pooled = true
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
				testOnBorrow=true
			    testWhileIdle=true
			    testOnReturn=true

        	}
		}
    }

    test {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
		    pooled = true
		    url = "jdbc:mysql://db1.test.rc-energy.net/p1"
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
				testOnBorrow=true
			    testWhileIdle=true
			    testOnReturn=true

        	}
			  
		}
	}

	production {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
		    pooled = true
		    url = "jdbc:mysql://db1.prod.rc-energy.net/p1"
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
				testOnBorrow=true
			    testWhileIdle=true
			    testOnReturn=true

        	}
			  
		}
	}
}