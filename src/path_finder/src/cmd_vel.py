#!/usr/bin/env python
import rospy
from std_msgs.msg import Float64MultiArray
from std_msgs.msg import UInt16
def publishCmd_vel(data):

    pub = rospy.Publisher('cmd_vel_action', UInt16, queue_size=10)
    rospy.loginfo(data)
    pub.publish(data)



def listener():
    #subscribe to a topic
    rospy.Subscriber("/cmd_vel_type", UInt16, publishCmd_vel)
    #init the node and give it a name
    rospy.init_node('cmd_vel', anonymous=True)
    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    try:
        listener()
    except rospy.ROSInterruptException:
        pass
