class BootStrap {

    def init = { servletContext ->
	environments {
	        production {
	            ctx.setAttribute("env", "prod")
	        }
	        development {
	            ctx.setAttribute("env", "dev")
	        }
	    }
    }
    def destroy = {
    }
}
