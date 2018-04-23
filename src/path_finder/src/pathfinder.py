#!/usr/bin/env python
import rospy
from std_msgs.msg import UInt16
from std_msgs.msg import String
from std_msgs.msg import Float64MultiArray
finishBayDirection =""
ir_right = 0
ir_left = 0

currentDirection =""
ultRight = 0
ultLeft = 0
currentIrRight = 0
currentIrLeft = 0
servoAngle = 0
travaledDistance = 0

def logDirection(data):
    rospy.loginfo(data)
    if finishBayDirection == "":
        finishBayDirection = data.data
    currentDirection = data.data
def logUltServo(data):
    rospy.loginfo(data)
    ultRight = data.data[0]
    ultLeft = data.data[1]
    servoAngle = data.data[2]

def logIr(data):
    rospy.loginfo(data)
    if ir_right == 0:
        ir_right =data.data[0]
    if ir_left == 0:
        ir_left = data.data[1]
    currentIrRight = data.data[0]
    currentIrLeft = data.data[1]

def publishCmd_vel():
    #publisher code
    pub = rospy.Publisher('/cmd_vel_type', UInt16, queue_size=10)
    action_msg = UInt16()
    if currentIrRight > ir_right + 10 and currentIrLeft < ir_left + 10:
        #publish turn left
        action_msg.data = 1
        pub.publish(action_msg)
    elif currentIrRight < ir_right + 10 and currentIrLeft > ir_left + 10:
        #publish turn right
        action_msg.data = 2
        pub.publish(action_msg)
    elif currentIrRight > ir_right + 10 and currentIrLeft > ir_left + 10:
        #publish based on the x posistion of the robot
#    else:
#        action_msg.data = 5
#        pub.publish(action_msg)

def listener():
    rospy.init_node('pathfinder', anonymous=True)
    rospy.Subscriber("/direction", String, logDirection)
    rospy.Subscriber("/ult_srv_NF", Float64MultiArray, logUltServo)
    rospy.Subscriber("/infrared", Float64MultiArray, logIr)
    #rospy.Subscriber("/distance", Float64MultiArray, logIr)

    rospy.spin()

if __name__ == '__main__':
    listener()
