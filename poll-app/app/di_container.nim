# poll
import usecases/poll/poll_query_interface
import data_stores/query_services/poll/poll_query
# poll
import models/poll/poll_repository_interface
import data_stores/repositories/poll/poll_repository

type DiContainer* = tuple
  pollQuery: IPollQuery
  pollRepository: IPollRepository

proc newDiContainer():DiContainer =
  return (
    pollQuery: PollQuery.new().toInterface(),
    pollRepository: PollRepository.new().toInterface(),
  )

let di* = newDiContainer()
