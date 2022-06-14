-raw-not-in-call   = Không có trong cuộc gọi thoại.
-raw-not-streaming = Không phát trực tuyến.
-error             = ❌ | <b>{$t}</b>
-ok                = ✅ | <b>{$t}</b>
-response          = {$e} | <b>{$t}</b>
-not-in-call       = {-error(t: "Không có trong cuộc gọi thoại.")}
-not-streaming     = {-error(t: "Không phát trực tuyến.")}

not-in-call     = {-not-in-call}
not-streaming   = {-not-streaming}
raw-not-in-call = {-raw-not-in-call}

errors =
    .no-call        = {-error(t: "Không có cuộc gọi thoại hoạt động.")}
    .no-video-found = {-error(t: "Không tìm thấy video.")}
    .unknown        = {-error(t: "Đã xảy ra lỗi.")}
    .file-too-big   = {-error(t: "This file is too big.")}
    .no-assistant   = {-error(t: "Trợ lý của tôi không có ở đây.")}
    .error          = {-error(t: "Đã xảy ra lỗi:")} {$message}

inputs =
    .audio-file    = Audio File
    .custom        = Custom Input
    .voice-message = Voice Message


shuffle =
    .shuffling      = {-response(e: "🔀", t: "Xáo trộn...")}
    .no-enough-items = {-error(t: "Không có đủ bài hát để xáo trộn")}

cache = {-response(e: "🗑", t: "Đã xóa cache.")}

now = 🎵 | Hiện đang phát nhạc <b><a href="{$titleUrl}">{$title}</a></b> by <b><a href="{$requesterUrl}">{$requester}</a></b>...

panel = 
    .text = {$nowEmoji} | <b><a href="{$nowUrl}">{$now}</a></b>
    ➡️ | <b><a href="{$nextUrl}">{$next}</a></b>
    .updated = Updated.
    .nothing-now   = Hiện không có bài hát
    .nothing-next  = Hiện không có gì phát trực tuyến

    .pause = {
        $result ->
        [true] Tạm dừng.
        [false] {-raw-not-streaming}
        *[null] {-raw-not-in-call}
    }

    .resume = {
        $result ->
        [true] Tiếp tục.
        [false] {-raw-not-streaming}
        *[null] {-raw-not-in-call}
    }

    .skip = {
        $result ->
        [true] Bỏ qua.
        [false] {-raw-not-streaming}
        *[null] {-raw-not-in-call}
    }

    .stop = {
        $result ->
        [true] Dừng lại.
        [false] {-raw-not-streaming}
        *[null] {-raw-not-in-call}
    }

    .mute = {
        $result ->
        [true] Đã tắt tiếng.
        [false] Đã tắt tiếng.
        *[null] {-raw-not-in-call}
    }

    .unmute = {
        $result ->
        [true] Đã bật tiếng.
        [false] Không bị tắt tiếng.
        *[null] {-raw-not-in-call}
    }

    .shuffling       = Xáo trộn...
    .volume          = Âm lượng chỉnh còn {$amount}.
    .no-enough-items = Không có đủ bài hát để.

playlist =
    .queuing           = 🎶 | <b>Xếp hàng {$x} bài hát...</b>
    .streaming-queuing = 🎶 | <b>Phát trực tuyến và xếp hàng {$x} bài hát...</b>

volume =
    .set     = 🔈 | <b>Đã chỉnh Âm lượng thành {$amount}.</b>
    .invalid = {-error(t: "Chuyển một số từ 0 đến 200.")}

lyrics =
    .not-found = {-error(t: "Không tìm thấy lời bài hát.")}
    .lyrics    = <b>{$title}</b> #lyrics
    
    {$lyrics}

search =
    .canceled         = {-ok(t: "Đã dừng tìm kiếm.")},
    .no-results-found = {-error(t: "Không tìm thấy kết quả.")}
    .active           = {-error(t: "Có một tìm kiếm đang hoạt động.")}
    .not_active       = {-error(t: "Không có tìm kiếm nào đang hoạt động.")}
    .header           = <b>🔍 | Tìm kiếm cho {$query}...</b>
    .no-query         = {-response(e: "❔", t: "Bạn muốn tôi tìm cái đéo gì?")}
    .footer           = <i>Trả lời số lượng kết quả bạn muốn phát trực tuyến hoặc /cancel.</i>
    .result           = 
        {$numberEmoji} <b><a href="{$url}">{$title}</a></b>
        {"  "}├ {$durationEmoji} {$duration}
        {"  "}├ 👁 {$views}
        {"  "}├ 📅 {$uploadTime}
        {"  "}└ 👤 {$uploader}

stream =
    .streaming = {-response(e: "▶️", t: "Đang phát nhạc...")}
    .queued-at =  #️⃣ | <b>Đã xếp hàng ở vị trí {$position}.</b>
    .no-input = {-response(e: "❔", t: "Bạn muốn tôi phát cái đéo gì?")}

pause = {
    $result ->
    [true] {-response(e: "⏸", t: "Tạm dừng.")}
    [false] {-not-streaming}
    *[null] {-not-in-call}
}

resume = {
    $result ->
    [true] {-response(e: "▶️", t: "Tiếp tục.")}
    [false] {-not-streaming}
    *[null] {-not-in-call}
}

skip = {
    $result ->
    [true] {-response(e: "⏩", t: "Bỏ qua.")}
    [false] {-not-streaming}
    *[null] {-not-in-call}
}

stop = {
    $result ->
    [true] {-response(e: "⏹", t: "Dừng lại.")}
    [false] {-not-streaming}
    *[null] {-not-in-call}
}

mute = {
    $result ->
    [true] {-response(e: "🔇", t: "Đã tắt tiếng.")}
    [false] {-error(t: "Đã bị tắt tiếng.")}
    *[null] {-not-in-call}
}

unmute = {
    $result ->
    [true] {-response(e: "🔈", t: "Đã bật tiếng.")}
    [false] {-error(t: "Không bị tắt tiếnv.")}
    *[null] {-not-in-call}
}

loop = {
    $result ->
    [true] {-response(e: "🔁", t: "Đã bật vòng lặp.")}
    *[false] {-response(e: "🔁", t: "Đã tắt vòng lặp.")}
}
