#!/usr/bin/env python
from std_msgs.msg import Float64MultiArray
from std_msgs.msg import String
def callback(data):
    #log the received msg to the terminal
    rospy.loginfo(data)
    #get the data from the msg
    x = data.data[0]
    y = data.data[1]
    z = data.data[2]
    #pass the data to the function that works out the direction
def getDirections(x , y , z):
    #get directions logic
    #publish the results
    #decalre the msg
    direction_msg = String()
    #decalre the publisher
    pub = rospy.Publisher('/direction', Float64MultiArray, queue_size=10)
    #add the data to the msg
    direction_msg.data = "North"
    #log the msg to the terminal
    rospy.loginfo(direction_msg)
    #publish the msg
    pub.publish(direction_msg)
def listener():
    rospy.init_node('compass', anonymous=True)
    rospy.Subscriber("/compass_raw_readings", Float64MultiArray, callback)
    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()
