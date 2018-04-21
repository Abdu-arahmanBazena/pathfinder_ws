#!/usr/bin/env python
import rospy
from std_msgs.msg import Float64MultiArray



def getReadings(readings):
    #after taking the avarage of 5
    rospy.loginfo(rospy.get_caller_id() + "ir_right %s", readings.data[0])
    rospy.loginfo(rospy.get_caller_id() + "ir_left %s", readings.data[1])
    publishToPathfinder(readings.data[0] ,readings.data[0])


def publishToPathfinder(ir_right , ir_left):

    pub = rospy.Publisher('/infrared', Float64MultiArray, queue_size=10)

def listener():

    #init the node and give it a name
    rospy.init_node('infrared_sensors', anonymous=True)
    #subscribe to a topic
    rospy.Subscriber("/ir_raw_readings", Float64MultiArray, getReadings)


    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()
if __name__ == '__main__':
    try:
        listener()
    except rospy.ROSInterruptException:
        pass
