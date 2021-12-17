import json
import ../../../libs/uid
# framework
import basolato/controller
# view
import  ../views/pages/index_view
#usecase
import ../../usecases/poll/select_usecase



proc toppage*(context:Context, params:Params):Future[Response] {.async.} = 
  return redirect("/poll")

proc index*(context:Context, params:Params):Future[Response] {.async.} =
  var 
    data: seq[JsonNode]
    status = false
  let
    userId = await context.get("user_id")
  let usecase = SelectUsecase.new()

  if userId != "":
    data = await usecase.find(userId)
    if data != @[]:
      status = true

  data = await usecase.all()
  return render(indexView(status, data))

proc store*(context:Context, params:Params):Future[Response] {.async.} = 
  if (await context.get("polled")) == "true":
    return redirect("/poll")  
  let 
    userId = genUid()
    selectItem = params.getStr("select_item")
    usecase = SelectUsecase.new()
  await usecase.run(userId, selectItem)

  await context.set("user_id", userId)
  await context.set("polled", "true")
  return redirect("/poll")