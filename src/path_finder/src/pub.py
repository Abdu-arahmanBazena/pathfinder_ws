#!/usr/bin/env python
# license removed for brevity
import rospy
from std_msgs.msg import UInt16



def talker():
    angle = 0
    pub = rospy.Publisher('servo', UInt16, queue_size=10)
    rospy.init_node('servo_cmd', anonymous=True)
    rate = rospy.Rate(2) # 10hz
    while not rospy.is_shutdown():
	    angle= 90
	    rospy.loginfo(angle)
	    pub.publish(angle)
	    rate.sleep()


	    angle= 60
	    rospy.loginfo(angle)
	    pub.publish(angle)
	    rate.sleep()


	    angle= 40
	    rospy.loginfo(angle)
	    pub.publish(angle)
	    rate.sleep()

	    angle= 60
	    rospy.loginfo(angle)
	    pub.publish(angle)
	    rate.sleep()


if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
