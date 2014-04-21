shared_examples :requests do
  let(:request) { double(:request) }
  subject { described_class.new(request) }

  describe "#configure" do
    let(:result) { double(:result) }

    context "when multipart" do
      it "should configure the request" do
        expect(subject).to receive(:set_accept_header)
        expect(subject).to receive(:multipart?).and_return(true)
        expect(subject).not_to receive(:set_content_type)
        expect(subject).to receive(:configure_multipart_request).and_return(result)

        expect(subject.configure).to eq result
      end
    end

    context "when get" do
      it "should configure the request" do
        expect(subject).to receive(:set_accept_header)
        expect(subject).to receive(:multipart?).and_return(false)
        expect(subject).to receive(:set_content_type)
        expect(subject).to receive(:get?).and_return(true)
        expect(subject).to receive(:configure_get_request).and_return(result)

        expect(subject.configure).to eq result
      end
    end

    context "when post" do
      it "should configure the request" do
        expect(subject).to receive(:set_accept_header)
        expect(subject).to receive(:multipart?).and_return(false)
        expect(subject).to receive(:set_content_type)
        expect(subject).to receive(:get?).and_return(false)
        expect(subject).to receive(:configure_post_request).and_return(result)

        expect(subject.configure).to eq result
      end
    end
  end

end
