/* Facts */
available_slot(monday, 16, 19).
available_slot(tuesday, 15, 18).
available_slot(wednesday, 14, 16).
available_slot(thursday, 8, 11).
available_slot(friday, 11, 14).
available_slot(saturday, 10, 16).
available_slot(sunday, 13, 15).

task(study_logic, 2).
task(read_book, 1).
task(gym_session, 1.5).
task(do_music, 3).

/* Rules */
compatible_schedule(Task, Day, StartTime, EndTime) :-
    task(Task, Duration),
    available_slot(Day, SlotStart, SlotEnd),
    StartTime is max(SlotStart, 8), % Adjust based on preferred start time
    EndTime is min(SlotEnd, 17),    % Adjust based on preferred end time
    Duration =< EndTime - StartTime.

suggest_schedule([], _, []).
suggest_schedule([Task|TaskList], AvailableSlots, [(Task, Day, StartTime, EndTime)|Schedule]) :-
    select((Day, StartTime, EndTime), AvailableSlots, UpdatedSlots),
    compatible_schedule(Task, Day, StartTime, EndTime),
    suggest_schedule(TaskList, UpdatedSlots, Schedule).