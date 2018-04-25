#!/usr/bin/env python
import rospy
from std_msgs.msg import Float64MultiArray


ir_right = []
ir_left = []


def getReadings(readings):
    # after taking the avarage of 5
    global ir_right
    global ir_left
    ir_right.append(readings.data[0])
    ir_left.append(readings.data[1])

    if len(ir_right) == 2:
        filtered_ir_right = reduce(lambda x, y: x + y, ir_right) / len(ir_right)
        filtered_ir_left = reduce(lambda x, y: x + y, ir_left) / len(ir_left)
        rospy.loginfo(rospy.get_caller_id() + "ir_right %s", readings.data[0])
        rospy.loginfo(rospy.get_caller_id() + "ir_left %s", readings.data[1])
        publishToPathfinder(filtered_ir_right, filtered_ir_left)
        ir_right = []
        ir_left = []


def publishToPathfinder(ir_right, ir_left):

    pub = rospy.Publisher('/infrared', Float64MultiArray, queue_size=10)
    data_msg = Float64MultiArray()
    data_msg.data = [ir_right, ir_left]
    pub.publish(data_msg)


def listener():

    # init the node and give it a name
    rospy.init_node('infrared_sensors', anonymous=True)
    # subscribe to a topic
    rate = rospy.Rate(20)  # 10hz
    rospy.Subscriber("/ir_raw_readings", Float64MultiArray, getReadings)
    # spin() simply keeps python from exiting until this node is stopped
    rate.sleep()
    rospy.spin()


if __name__ == '__main__':
    try:
        listener()
    except rospy.ROSInterruptException:
        pass
