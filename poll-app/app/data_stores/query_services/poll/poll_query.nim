import asyncdispatch
import interface_implements
import allographer/query_builder
from ../../../../config/database import rdb
import ../../../usecases/poll/poll_query_interface


type PollQuery* = ref object

proc new*(_:type PollQuery):PollQuery =
  return PollQuery()

implements PollQuery, IPollQuery:
  discard
