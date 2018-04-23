#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from std_msgs.msg import Float64MultiArray

def logDirection(data):
    rospy.loginfo(data)
def logUltServo(data):
    rospy.loginfo(data)
def logIr(data):
    rospy.loginfo(data)
currentDirection =""
ultRight = 0
ultLeft = 0
irRight = 0
irLeft = 0
servoAngle = 0
travaledDistance = 0

def listener():
    rospy.init_node('pathfinder', anonymous=True)
    rospy.Subscriber("/direction", String, logDirection)
    rospy.Subscriber("/ult_srv_NF", Float64MultiArray, logUltServo)
    rospy.Subscriber("/infrared", Float64MultiArray, logIr)
    #rospy.Subscriber("/distance", Float64MultiArray, logIr)

    rospy.spin()

if __name__ == '__main__':
    listener()
