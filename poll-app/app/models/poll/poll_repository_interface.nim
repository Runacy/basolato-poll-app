import asyncdispatch, json
import poll_value_objects
import poll_entity


type IPollRepository* = tuple
    insert: proc(poll:Poll):Future[void]
    getSelectedId: proc(userId: PollId): Future[seq[JsonNode]]
    getAll: proc():Future[seq[JsonNode]]