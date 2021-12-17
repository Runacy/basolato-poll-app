import re
# framework
import basolato
# controller
import app/http/controllers/poll_controller
import app/http/controllers/admin_controller
# middleware
import app/http/middlewares/auth_middleware
import app/http/middlewares/cors_middleware

var routes = Routes.new()
routes.middleware(re".*", auth_middleware.checkCsrfTokenMiddleware)
routes.middleware(re"/api/.*", cors_middleware.setCorsHeadersMiddleware)


routes.get("/", poll_controller.toppage)
routes.get("/poll", poll_controller.index)
routes.post("/poll", poll_controller.store)

serve(routes)
