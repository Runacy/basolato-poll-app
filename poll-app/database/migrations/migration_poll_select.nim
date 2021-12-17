import asyncdispatch
import allographer/schema_builder
from ../../config/database import rdb


proc poll_select*() {.async.} =
  rdb.schema(
    table("poll_select", [
      Column().string("user_id"),
      Column().string("select_item")
    ])
  )
