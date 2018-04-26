#!/usr/bin/env python
import threading

import rospy
from std_msgs.msg import Float64MultiArray
from std_msgs.msg import UInt16MultiArray
from std_msgs.msg import UInt16

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
servo_status = 1

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
    avoid_ob()


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
    # avoid_drop()


def avoid_ob():
    # fhfkd
    global ultRight
    global ultLeft
    global servoAngle
    pub = rospy.Publisher('/cmd_vel_action', UInt16MultiArray, queue_size=10)
    rate = rospy.Rate(2)  # 10hz
    action_msg = UInt16MultiArray()
    if ultRight <= 20 or ultLeft <= 20:
        if servoAngle == 40:
            action_msg.data = [0, 1]
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1.2)
            action_msg.data = [0, 4]
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1)
            action_msg.data = [60, 2]
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1.2)
            # avoid obstacle from the right
            # turn left
            # then right
            # try to go straight
            servoAngle = 60
        elif servoAngle == 60:
            # avoid obstacle straight
            servoAngle = 0
        elif servoAngle == 90:
            action_msg.data = [140, 2]
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1.2)
            action_msg.data = [140, 4]
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1)
            action_msg.data = [60, 1]
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1.2)
            servoAngle = 60
        rate.sleep()
    else:
        global servo_status
        pub = rospy.Publisher('/cmd_vel_action', UInt16MultiArray, queue_size=10)
        rate = rospy.Rate(2)  # 10hz
        action_msg = UInt16MultiArray()
        if servo_status == 1:
            action_msg.data = [40, 4]
            servo_status = 2
        elif servo_status == 2:
            action_msg.data = [60, 4]
            servo_status = 3
        elif servo_status == 3:
            action_msg.data = [90, 4]
            servo_status = 4
        elif servo_status == 4:
            action_msg.data = [60, 4]
            servo_status = 1
        rospy.loginfo(action_msg)
        pub.publish(action_msg)
        rate.sleep()


def avoid_drop():
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
    pub = rospy.Publisher('/cmd_vel_action', UInt16MultiArray, queue_size=10)
    rate = rospy.Rate(10)  # 10hz
    action_msg = UInt16MultiArray()
    while not rospy.is_shutdown():
        if currentIrRight > ir_right + 10 and currentIrLeft < ir_left + 10:

            # publish turn left
            action_msg.data = [60, 5]
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1)
            action_msg.data = [60, 3]
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1)
            action_msg.data = [60, 1]
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1.2)
            action_msg.data = [60, 4]
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1.2)
            action_msg.data = [60, 2]
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1.2)

        elif currentIrRight < ir_right + 10 and currentIrLeft > ir_left + 10:
            # publish turn right
            action_msg.data = [60, 5] # stop first
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1)
            action_msg.data = [60, 3]  # go back
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1)
            action_msg.data = [60, 2] # turn right
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1.2)
            action_msg.data = [60, 4]   # go forward
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1.2)
            action_msg.data = [60, 1]  # turn left
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1.2)

        elif currentIrRight > ir_right + 10 and currentIrLeft > ir_left + 10:

            action_msg.data = [60, 5]
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1)
            action_msg.data = [60, 3]
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1)
            action_msg.data = [60, 1]
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1.2)
            action_msg.data = [60, 4]
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1.2)
            action_msg.data = [60, 2]
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
            time.sleep(1.2)

        elif currentIrRight < ir_right + 10 and currentIrLeft < ir_left + 10:
            action_msg.data = [60, 4]
            rospy.loginfo(action_msg)
            pub.publish(action_msg)
        else:
            action_msg.data = [60, 0]
            rospy.loginfo(action_msg)
            pub.publish(action_msg)

        rate.sleep()


def listener():
    global seq
    rospy.init_node('pathfinder', anonymous=False)
    rospy.Subscriber("/direction", UInt16, logDirection)
    rospy.Subscriber("/ult_srv_NF", Float64MultiArray, logUltServo)
    rospy.Subscriber("/infrared", Float64MultiArray, logIr)
    # rospy.Subscriber("/distance", Float64MultiArray, logIr)
    rospy.spin()

if __name__ == '__main__':
    listener()
