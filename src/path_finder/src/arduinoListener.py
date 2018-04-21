#!/usr/bin/env python
import rospy
from path_finder.msg import ard
from std_msgs.msg import Float64MultiArray

def callback(data):
    rospy.loginfo(rospy.get_caller_id() + "ult_right %s", data.ult_right)
    rospy.loginfo(rospy.get_caller_id() + "ult_left %s", data.ult_left)
    rospy.loginfo(rospy.get_caller_id() + "ir_right %s", data.ir_right)
    rospy.loginfo(rospy.get_caller_id() + "ir_left %s", data.ir_left)
    rospy.loginfo(rospy.get_caller_id() + "seq %s", data.seq)
    rospy.loginfo(rospy.get_caller_id() + "time %s", data.stamp)
    infraredPub( data.ir_right , data.ir_left)
    #ultrasonicPub(data.ult_right , data.ult_left ,data.servo_angle)
    #compassPub(data.compass_x , data.compass_y , data.compass_z )
    #compass_x
    #compass_y
    #compass_z
    #servo_angle
def infraredPub(ir_right , ir_left):

    ir_msg = Float64MultiArray()

    pub = rospy.Publisher('/ir_raw_readings', Float64MultiArray, queue_size=10)



    ir_msg.data = [ir_right , ir_left] 



    rospy.loginfo(ir_msg)

    pub.publish(ir_msg)


#def ultrasonicPub(ult_right , ult_left , servo_angle):
#    pub = rospy.Publisher('/ultrasonic_servo_angle', Float64MultiArray, queue_size=10)
#def compassPub(x , y , z):
#    pub = rospy.Publisher('/compass_raw_readings', Float64MultiArray, queue_size=10)

def listener():
    rospy.init_node('arduino_readings_listener', anonymous=True)
    rospy.Subscriber("arduino_readings", ard, callback)
    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()
