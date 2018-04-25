#!/usr/bin/env python
import threading

import rospy
from std_msgs.msg import UInt16
from std_msgs.msg import String
from std_msgs.msg import Float64MultiArray
import time

finishBayDirection = 0
right_direction = 116
left_direction = 225
ir_right = 0
ir_left = 0
currentDirection = 0
ultRight = 0
ultLeft = 0
currentIrRight = 0
currentIrLeft = 0
servoAngle = 0
traveledDistance = 0
seq = 0

def logDirection(data):
    # rospy.loginfo(data)
    global finishBayDirection
    global currentDirection
    if finishBayDirection == 0:
        finishBayDirection = data.data
    currentDirection = data.data


def logUltServo(data):
    # rospy.loginfo(data)
    global ultRight
    global ultLeft
    global servoAngle
    ultRight = data.data[0]
    ultLeft = data.data[1]
    servoAngle = data.data[2]


def logIr(data):
    # rospy.loginfo(data)
    # reference global vars
    global ir_right
    global ir_left
    # check if the init values have been registered
    if ir_right == 0:
        ir_right = data.data[0]
        print(ir_right)
    if ir_left == 0:
        ir_left = data.data[1]
        print(ir_left)
    # reference temp global vars then update values
    global currentIrRight
    currentIrRight = data.data[0]
    global currentIrLeft
    currentIrLeft = data.data[1]


def publishCmd_vel():
    global ir_right
    global ir_left
    global currentIrRight
    global currentIrLeft
    global currentDirection
    global left_direction
    global right_direction
    left_direction = 116
    right_direction = 225
    # publisher code
    pub = rospy.Publisher('/cmd_vel_action', UInt16, queue_size=10)
    rate = rospy.Rate(10)  # 10hz
    action_msg = UInt16()
    while not rospy.is_shutdown():
        if currentIrRight > ir_right + 10 and currentIrLeft < ir_left + 10:

            # publish turn left
            action_msg.data = 5
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1)
            action_msg.data = 3
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1)
            action_msg.data = 1
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1.2)
            action_msg.data = 4
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1.2)
            action_msg.data = 2
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1.2)

        elif currentIrRight < ir_right + 10 and currentIrLeft > ir_left + 10:
            # publish turn right
            action_msg.data = 5  # stop first
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1)
            action_msg.data = 3  # go back
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1)
            action_msg.data = 2  # turn right
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1.2)
            action_msg.data = 4   # go forward
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1.2)
            action_msg.data = 1  # turn left
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1.2)

        elif currentIrRight > ir_right + 10 and currentIrLeft > ir_left + 10:

            action_msg.data = 5
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1)
            action_msg.data = 3
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1)
            action_msg.data = 1
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1.2)
            action_msg.data = 4
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1.2)
            action_msg.data = 2
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1.2)

        elif currentIrRight < ir_right + 10 and currentIrLeft < ir_left + 10:
            action_msg.data = 4
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
        else:
            action_msg.data = 0
            rospy.loginfo(action_msg)
            pub.publish(action_msg)

        rate.sleep()


def listener():
    global seq
    rospy.init_node('pathfinder', anonymous=True)
    rospy.Subscriber("/direction", UInt16, logDirection)
    rospy.Subscriber("/ult_srv_NF", Float64MultiArray, logUltServo)
    rospy.Subscriber("/infrared", Float64MultiArray, logIr)
    # rospy.Subscriber("/distance", Float64MultiArray, logIr)
    publishCmd_vel()
    rospy.spin()

if __name__ == '__main__':
    listener()
