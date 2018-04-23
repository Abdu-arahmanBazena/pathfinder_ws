#!/usr/bin/env python
import rospy
from std_msgs.msg import Float64MultiArray
def callback(data):
    #data buffer
    #then pass it to the function publishMSG
    publishMsg(data.data[0] , data.data[1] , data.data[2])
def publishMsg(ult_right , ult_left , servo_angle):
    ult_msg = Float64MultiArray()
    #decalre the publisher
    pub = rospy.Publisher('/ult_srv_NF', Float64MultiArray, queue_size=10)
    #add the data to the msg
    ult_msg.data = [ult_right , ult_left, servo_angle]
    #log the msg to the terminal
    rospy.loginfo(ult_msg)
    #publish the msg
    pub.publish(ult_msg)

def listener():
    rospy.init_node('ultrasonic_sensors_servo', anonymous=True)
    rospy.Subscriber("/ultrasonic_servo_angle", Float64MultiArray, callback)
    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()
