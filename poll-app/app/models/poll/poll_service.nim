import poll_value_objects
import poll_entity
import poll_repository_interface
import ../../di_container

type PollService* = ref object
  repository: IPollRepository

proc new*(_:type PollService):PollService =
  return PollService(
    repository: di.pollRepository
  )
