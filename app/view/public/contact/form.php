<form action="/contact/send" method="POST">
    <div>
        <label for="name">Name</label>
        <input type="text" name="name" id="name" value="<?php echo $data['post_data']["name"]; ?>" required>
    </div>
    <div>
        <label for="email">Email</label>
        <input type="text" name="email" id="email" value="<?php echo $data['post_data']["email"]; ?>" required>
    </div>
    <div>
        <label for="message">Message</label>
        <textarea name="message" id="message" required><?php echo $data['post_data']["message"]; ?></textarea>
    </div>
    <button type="submit">Send</button>
</form>

<div>google maps</div>
<div>Tel/email</div>