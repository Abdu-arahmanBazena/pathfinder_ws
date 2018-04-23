#!/usr/bin/env python
import rospy
from std_msgs.msg import Float64MultiArray
from std_msgs.msg import UInt16
def publishCmd_vel():
    #publisher code
    pub = rospy.Publisher('/cmd_vel_action', UInt16, queue_size=10)
    rate = rospy.Rate(10) # 10hz
    action_msg = UInt16()
    action_msg.data = 1
    pub.publish(action_msg)
    rate.sleep()


def listener():

    #init the node and give it a name
    rospy.init_node('cmd_vel', anonymous=False)
    #subscribe to a topic
    #rospy.Subscriber("/cmd_vel_type", UInt16, publishCmd_vel)
    publishCmd_vel()
    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

def talker():
    angle = 0
    pub = rospy.Publisher('cmd_vel_action', UInt16, queue_size=10)
    rospy.init_node('cmd_vel', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():
	    angle= 1
	    rospy.loginfo(angle)
	    pub.publish(angle)
	    rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
