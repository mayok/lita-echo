require "spec_helper"

describe Lita::Handlers::Echo, lita_handler: true do
  it { is_expected.to route("echo") }
  it { is_expected.to route("echo").to(:echo) }

  it "echoes back text" do
    send_message("hoge")
    expect(replies.last).to include("hoge")
  end
end
