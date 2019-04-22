class UploadimgsController < ApplicationController
  
  def create
    
    filename = "#{SecureRandom.uuid}.jpg"
    key = "#{filename}"
    
    data = {

    "url":[
        {
            "filename":filename, "key":key
        }
    ]
    }
    
    policies = get_policies(filename, key)
    
    render :json => policies


  end
  
  
  private

  def get_policies(filename ,key)
    
    bucket = 'weatherme'
    url = 'https://s3-ap-northeast-1.amazonaws.com/weatherme'

    policy_document = {
        expiration: (Time.now + 5.minute).utc,
        conditions: [
            { "bucket": bucket },
            { "acl": 'public-read'},
            [ 'starts-with', '$key', key],
        ]
    }.to_json

    policy = Base64.encode64(policy_document).gsub("\n", '')
    signature = Base64.encode64(
        OpenSSL::HMAC.digest(
            OpenSSL::Digest::Digest.new('sha1'),
            "i1g4+XxmVFSzvnmnYp2vinNPPbiQlrVzw7eYVdw0", policy)).gsub("\n", '')

    policies = {
        filename: filename,
        url: url,
        form: {
            'AWSAccessKeyId' => "AKIAJUFR4W36Y2I5W3OA",
            signature: signature,
            policy: policy,
            key: key,
            acl: 'private'
        }
      }
  end  
end
