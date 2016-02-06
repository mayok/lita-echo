module Lita
  module Handlers
    class Echo < Handler
      route(/^echo\s+(.+)/, :echo, help: {"echo TEXT" => "Echoes back TEXT"})

      def echo(response)
        text = response.matches[0][0]
        target = response.room
        attachment = Lita::Adapters::Slack::Attachment.new(
          text, {
            color: "#36a64f",
            pretext: "Optional text that appears above the attachment block",
            author_name: "Bobby Tables",
            title: "Slack API Documentation",
            title_link: "https://api.slack.com/",
            text: text,
            fields: [
              {
                title: "Priority",
                value: "High",
                short: true
              },
              {
                title: "Environment",
                value: "production",
                short: true
              }
            ]
          }
        )

        robot.chat_service.send_attachment(target, attachment)
      end

      Lita.register_handler(self)
    end
  end
end
