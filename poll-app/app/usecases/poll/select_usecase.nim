import asyncdispatch, json
import ../../di_container
import ../../models/poll/poll_repository_interface
import ../../models/poll/poll_entity
import ../../models/poll/poll_service
import ../../models/poll/poll_value_objects

type SelectUsecase* = ref object
  pollRepository: IPollRepository
  service: PollService

proc new*(_:type SelectUsecase):SelectUsecase =
  return SelectUsecase(
    pollRepository: di.pollRepository,
    service: PollService.new()
  )

proc find*(self: SelectUsecase, userId: string): Future[seq[JsonNode]] {.async.} =
  let userId = PollId.new(userId)
  return await self.pollRepository.getSelectedId(userId)

proc all*(self: SelectUsecase): Future[seq[JsonNode]] {.async.} = 
  return await self.pollRepository.getAll()

proc run*(self:SelectUsecase, userId: string, selectItem: string){.async.} =
  let userId = PollId.new(userId)
  let selectItem = SelectItem.new(selectItem)
  let poll = Poll.new(userId, selectItem)
  await self.pollRepository.insert(poll)
