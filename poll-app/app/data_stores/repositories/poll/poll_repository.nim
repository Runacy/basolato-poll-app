import asyncdispatch, json, options
import interface_implements
import allographer/query_builder
from ../../../../config/database import rdb
import ../../../models/poll/poll_value_objects
import ../../../models/poll/poll_entity
import ../../../models/poll/poll_repository_interface


type PollRepository* = ref object

proc new*(_:type PollRepository):PollRepository =
  return PollRepository()

implements PollRepository, IPollRepository:
  proc insert(self: PollRepository, poll:Poll): Future[void] {.async.} = 
    await rdb.table("poll_select").insert(
      %*{
        "user_id": $poll.pollId,
        "select_item": $poll.selectItem
      }
    )
  
  proc getSelectedId(self: PollRepository, userId: PollId):Future[seq[JsonNode]] {.async.} = 
    return await rdb.table("poll_select").where("user_id", "=", $userId).get()

  proc getAll(self: PollRepository):Future[seq[JsonNode]] {.async.} = 
    return await rdb.table("poll_select")
                  .select("select_item", "count(select_item)")
                  .group_by("select_item").get()