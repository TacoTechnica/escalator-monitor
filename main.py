import encoder

import requests

SERVER_URL = "burnished-range-162019.appspot.com"#"104.236.29.158:5000"

UPDATE_URL = "http://%s/update" % SERVER_URL

def loop():
    while True:
        encoder.update_delta()
        state = encoder.get_direction()
        print "encoderState: %s" % state
        update_state("Test")#state)

def update_state(on_off_state):
    #print "Server response before: %s" % (requests.get("http://" + SERVER_URL + "/getData").content)
    r = requests.post(UPDATE_URL, dict(state=on_off_state), allow_redirects=True)
    print "server response: %s" % r.content
    print "Server response data post: %s" % (requests.get("http://" + SERVER_URL + "/getData").content)


if __name__ == "__main__":
    loop()
